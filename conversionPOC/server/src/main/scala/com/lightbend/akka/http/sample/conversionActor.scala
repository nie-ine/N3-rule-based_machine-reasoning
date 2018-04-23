package com.lightbend.akka.http.sample

import akka.actor.{ Actor, ActorLogging, Props }

//#printer-companion
//#printer-messages
object conversionActor {
  //#printer-messages
  def props: Props = Props[conversionActor]
  //#printer-messages
  final case class PleaseStartToCheck(greeting: String)
}
//#printer-messages
//#printer-companion

//#printer-actor
class conversionActor extends Actor with ActorLogging {
  import conversionActor._

  def receive = {
    case PleaseStartToCheck(greeting) =>
      log.info(s"Greeting received (from ${sender()}): $greeting")

  }
}
//#printer-actor