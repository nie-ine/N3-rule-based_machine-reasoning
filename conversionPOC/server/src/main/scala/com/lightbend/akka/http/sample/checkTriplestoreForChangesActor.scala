package com.lightbend.akka.http.sample

import akka.actor.{ Actor, ActorRef, Props }

import scala.concurrent.Future
import scala.util.{ Failure, Success }
import akka.actor.ActorSystem
import akka.actor.{ Actor, ActorLogging }
import akka.http.scaladsl.Http
import akka.http.scaladsl.model._
import akka.stream.{ ActorMaterializer, ActorMaterializerSettings }
import akka.util.ByteString
import StatusCodes._
import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport

//#greeter-companion
//#greeter-messages
object checkTripleStoreForChanges {
  //#greeter-messages
  def props(message: String, printerActor: ActorRef): Props = Props(new checkTripleStoreForChanges(message, printerActor))
  //#greeter-messages
  final case class whichServerToCheck(who: String)
  case object startChecking
}
//#greeter-messages
//#greeter-companion

//#greeter-actor
class checkTripleStoreForChanges(message: String, convertorActor: ActorRef) extends Actor {
  import checkTripleStoreForChanges._
  import conversionActor._

  var ipAddr = ""

  def receive = {
    case whichServerToCheck(server) =>
      println(message)
      ipAddr = s"$server"
    case `startChecking` =>
      //#greeter-send-message
      if (detectChanges.detectChanges(ipAddr)) convertorActor ! PleaseStartToCheck(ipAddr)
      else println("No changes detected")
    //#greeter-send-message
  }
}
//#greeter-actor

object detectChanges {
  def detectChanges(server: String): Boolean = {
    import akka.pattern.pipe

    println(s"Check $server for changes")
    println("\nSend basic REST request and print response\n")

    implicit val system = ActorSystem()
    implicit val materializer = ActorMaterializer()
    // needed for the future flatMap/onComplete in the end
    implicit val executionContext = system.dispatcher

    val responseFuture: Future[HttpResponse] = Http().singleRequest(HttpRequest(uri = server))

    responseFuture
      .onComplete {
        case Success(res) =>
          println("\n" +
            res.entity.dataBytes.runFold(ByteString(""))(_ ++ _).foreach { body =>
              println(s"Got response from $server and it says: \n\n " + body.utf8String + "\n\n-----")
            } + "\n")
        case Failure(_) =>
          sys.error("something wrong")
      }

    return true

  }
}