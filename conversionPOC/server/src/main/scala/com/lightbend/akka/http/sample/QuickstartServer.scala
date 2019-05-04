package com.lightbend.akka.http.sample

import akka.actor.{ Actor, ActorLogging, ActorRef, ActorSystem, Props }
import akka.http.scaladsl.Http
import akka.http.scaladsl.Http.ServerBinding
import akka.http.scaladsl.server.Route
import akka.stream.ActorMaterializer

import scala.concurrent.{ ExecutionContext, Future }
import scala.io.StdIn

import com.lightbend.akka.http.sample.checkTripleStoreForChanges._

import scala.concurrent.duration._

//#main-class
object QuickstartServer extends App with UserRoutes {

  // set up ActorSystem and other dependencies here
  //#main-class
  //#server-bootstrapping
  implicit val system: ActorSystem = ActorSystem("helloAkkaHttpServer")
  implicit val materializer: ActorMaterializer = ActorMaterializer()
  //#server-bootstrapping

  // Needed for the Future and its methods flatMap/onComplete in the end
  implicit val executionContext: ExecutionContext = system.dispatcher

  val userRegistryActor: ActorRef = system.actorOf(UserRegistryActor.props, "userRegistryActor")

  // creating 1st actor
  val converter: ActorRef = system.actorOf(
    conversionActor.props,
    "startConversionActor"
  )

  // Create the 'checkTripleStoreForChanges' actors
  val graphDBZuerichChecker: ActorRef =
    system.actorOf(
      checkTripleStoreForChanges.props(
        "Please check the following server for changes:",
        converter
      ),
      "graphDBZuerichChecker"
    )

  //#main-send-messages
  graphDBZuerichChecker ! whichServerToCheck("http://google.com")
  val cancellable =
    system.scheduler.schedule(
      0 seconds,
      10 seconds,
      graphDBZuerichChecker,
      startChecking
    )

  //#main-class
  // from the UserRoutes trait
  lazy val routes: Route = userRoutes
  //#main-class

  //#http-server
  val serverBindingFuture: Future[ServerBinding] = Http().bindAndHandle(routes, "localhost", 8080)

  println(s"Server online at http://localhost:8080/\nPress RETURN to stop...")

  StdIn.readLine()

  serverBindingFuture
    .flatMap(_.unbind())
    .onComplete { done =>
      done.failed.map { ex => log.error(ex, "Failed unbinding") }
      system.terminate()
    }
  //#http-server
  //#main-class

}
//#main-class
