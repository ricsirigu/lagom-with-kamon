# Hello Lagom with Kamon

This project aims to demonstrate a problem when Kamon gets added to a Lagom project

# How to run

This project needs docker installed in order to launch Lagom in production mode

* sbt dist
* docker build -t "hello-lagom:kamon" .
* docker run -p 9999:9999 hello-lagom:kamon

By default the JVM listens to the port 9999 for debug purposes

The resulting error is the following

```
Exception in thread "main" java.lang.NoSuchMethodError: akka.kamon.instrumentation.ActorLoggingInstrumentation.aspectOf()Lakka/kamon/instrumentation/ActorLoggingInstrumentation;
        at akka.event.Logging$Debug.<init>(Logging.scala:820)
        at akka.event.LoggingBus.startStdoutLogger(Logging.scala:94)
        at akka.event.LoggingBus.startStdoutLogger$(Logging.scala:92)
        at akka.event.EventStream.startStdoutLogger(EventStream.scala:22)
        at akka.actor.ActorSystemImpl.<init>(ActorSystem.scala:757)
        at akka.actor.ActorSystem$.apply(ActorSystem.scala:246)
        at play.api.libs.concurrent.ActorSystemProvider$.start(Akka.scala:187)
        at play.api.libs.concurrent.ActorSystemProvider$.start(Akka.scala:149)
        at com.lightbend.lagom.scaladsl.server.ActorSystemProvider$.start(LagomApplicationLoader.scala:264)
        at com.lightbend.lagom.scaladsl.server.LagomApplication.actorSystem$lzycompute(LagomApplicationLoader.scala:238)
        at com.lightbend.lagom.scaladsl.server.LagomApplication.actorSystem(LagomApplicationLoader.scala:237)
        at play.api.BuiltInComponents.tempFileReaper(Application.scala:334)
        at play.api.BuiltInComponents.tempFileReaper$(Application.scala:334)
        at play.api.BuiltInComponentsFromContext.tempFileReaper$lzycompute(ApplicationLoader.scala:122)
        at play.api.BuiltInComponentsFromContext.tempFileReaper(ApplicationLoader.scala:122)
        at play.api.BuiltInComponents.tempFileCreator(Application.scala:335)
        at play.api.BuiltInComponents.tempFileCreator$(Application.scala:335)
        at play.api.BuiltInComponentsFromContext.tempFileCreator$lzycompute(ApplicationLoader.scala:122)
        at play.api.BuiltInComponentsFromContext.tempFileCreator(ApplicationLoader.scala:122)
        at play.api.BuiltInComponents.playBodyParsers(Application.scala:280)
        at play.api.BuiltInComponents.playBodyParsers$(Application.scala:279)
        at play.api.BuiltInComponentsFromContext.playBodyParsers$lzycompute(ApplicationLoader.scala:122)
        at play.api.BuiltInComponentsFromContext.playBodyParsers(ApplicationLoader.scala:122)
        at com.lightbend.lagom.scaladsl.server.LagomServerComponents.lagomServerBuilder(LagomServer.scala:85)
        at com.lightbend.lagom.scaladsl.server.LagomServerComponents.lagomServerBuilder$(LagomServer.scala:85)
        at com.lightbend.lagom.scaladsl.server.LagomApplication.lagomServerBuilder$lzycompute(LagomApplicationLoader.scala:221)
        at com.lightbend.lagom.scaladsl.server.LagomApplication.lagomServerBuilder(LagomApplicationLoader.scala:221)
        at com.example.hello.impl.HelloApplication.lagomServer$lzycompute(HelloLoader.scala:33)
        at com.example.hello.impl.HelloApplication.lagomServer(HelloLoader.scala:33)
        at com.lightbend.lagom.scaladsl.server.LagomApplication.<init>(LagomApplicationLoader.scala:243)
        at com.example.hello.impl.HelloApplication.<init>(HelloLoader.scala:27)
        at com.example.hello.impl.HelloLoader$$anon$2.<init>(HelloLoader.scala:16)
        at com.example.hello.impl.HelloLoader.load(HelloLoader.scala:16)
        at com.lightbend.lagom.scaladsl.server.LagomApplicationLoader.load(LagomApplicationLoader.scala:77)
        at play.core.server.ProdServerStart$.start(ProdServerStart.scala:51)
        at play.core.server.ProdServerStart$.main(ProdServerStart.scala:25)
        at play.core.server.ProdServerStart.main(ProdServerStart.scala)

```
