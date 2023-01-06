;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUESTIONS RULES *
;;;***************


(defrule begin ""

   (logical (start))

   =>

   (assert (UI-state (display action.query)
                     (relation-asserted action)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule terminator-rule ""

   (logical (action Yes))

   =>

   (assert (UI-state (display terminator.query)
                     (relation-asserted terminator)
                     (response Yes)
                     (valid-answers Yes No))))   

(defrule war-rule ""

   (logical (terminator No))

   =>

   (assert (UI-state (display war.query)
                     (relation-asserted war)
                     (response Yes)
                     (valid-answers Yes No))))            

(defrule horses-rule ""

   (logical (war No))

   =>

   (assert (UI-state (display horses.boots.query)
                     (relation-asserted horses)
                     (response Yes)
                     (valid-answers Yes No))))  

(defrule oldschool-rule ""

   (logical (horses Yes))

   =>

   (assert (UI-state (display oldschool.fresh.query)
                     (relation-asserted oldschool)
                     (response Old)
                     (valid-answers Old Fresh)))) 

(defrule serious-rule ""

   (logical (horses No))

   =>

   (assert (UI-state (display serious.query)
                     (relation-asserted serious)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule future-rule ""

   (logical (serious Yes))

   =>

   (assert (UI-state (display future.query)
                     (relation-asserted future)
                     (response Future)
                     (valid-answers Future Now)))) 

(defrule documentary-rule ""

   (logical (action No))

   =>

   (assert (UI-state (display documentary.query)
                     (relation-asserted documentary)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule snowboard-rule ""

   (logical (documentary Yes))

   =>

   (assert (UI-state (display snowboard.query)
                     (relation-asserted snowboard)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule facemelted-rule ""

   (logical (snowboard No))

   =>

   (assert (UI-state (display facemelted.query)
                     (relation-asserted facemelted)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule streets-rule ""

   (logical (facemelted No))

   =>

   (assert (UI-state (display streets.query)
                     (relation-asserted streets)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule painpaint-rule ""

   (logical (streets Yes))

   =>

   (assert (UI-state (display painpaint.query)
                     (relation-asserted painpaint)
                     (response Pain)
                     (valid-answers Pain Paint)))) 

(defrule religion-rule ""

   (logical (streets No))

   =>

   (assert (UI-state (display religion.query)
                     (relation-asserted religion)
                     (response Yes)
                     (valid-answers Yes No)))) 
                  
(defrule woodyallen-rule ""

   (logical (religion No))

   =>

   (assert (UI-state (display woodyallen.query)
                     (relation-asserted woodyallen)
                     (response Yes)
                     (valid-answers Yes No))))              

(defrule subtitles-rule ""

   (logical (woodyallen No))

   =>

   (assert (UI-state (display subtitles.query)
                     (relation-asserted subtitles)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule monsters-rule ""

   (logical (documentary No))

   =>

   (assert (UI-state (display monsters.query)
                     (relation-asserted monsters)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule chainsaw-rule ""

   (logical (monsters Yes))

   =>

   (assert (UI-state (display chainsaw.query)
                     (relation-asserted chainsaw)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule horror-rule ""

   (logical (chainsaw No))

   =>

   (assert (UI-state (display horror.query)
                     (relation-asserted horror)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule asylums-rule ""

   (logical (horror No))

   =>

   (assert (UI-state (display asylums.query)
                     (relation-asserted asylums)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule laughmood-rule ""

   (logical (monsters No))

   =>

   (assert (UI-state (display laugh.mood.query)
                     (relation-asserted laughmood)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule laughdrama-rule ""

   (logical (laughmood Yes))

   =>

   (assert (UI-state (display laugh.drama.query)
                     (relation-asserted laughdrama)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule breakout-rule ""

   (logical (laughdrama No))

   =>

   (assert (UI-state (display breakout.query)
                     (relation-asserted breakout)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule clever-rule ""

   (logical (breakout No))

   =>

   (assert (UI-state (display clever.query)
                     (relation-asserted clever)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule blackwhite-rule ""

   (logical (laughdrama Yes))

   =>

   (assert (UI-state (display blackwhite.query)
                     (relation-asserted blackwhite)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule lewd-rule ""

   (logical (blackwhite No))

   =>

   (assert (UI-state (display lewd.query)
                     (relation-asserted lewd)
                     (response More)
                     (valid-answers More Less)))) 

(defrule paulnewman-rule ""

   (logical (blackwhite Yes))

   =>

   (assert (UI-state (display paulnewman.query)
                     (relation-asserted paulnewman)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule greatlegendary-rule ""

   (logical (paulnewman Yes))

   =>

   (assert (UI-state (display greatlegendary.query)
                     (relation-asserted greatlegendary)
                     (response Great)
                     (valid-answers Great Legend)))) 

(defrule grittypretty-rule ""

   (logical (paulnewman No))

   =>

   (assert (UI-state (display grittypretty.query)
                     (relation-asserted grittypretty)
                     (response Pretty)
                     (valid-answers Pretty Gritty)))) 

(defrule romanticindie-rule ""

   (logical (grittypretty Pretty))

   =>

   (assert (UI-state (display romanticindie.query)
                     (relation-asserted romanticindie)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule adventure-rule ""

   (logical (laughmood No))

   =>

   (assert (UI-state (display adventure.query)
                     (relation-asserted adventure)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule firefly-rule ""

   (logical (adventure Yes))

   =>

   (assert (UI-state (display firefly.query)
                     (relation-asserted firefly)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule kids-rule ""

   (logical (firefly No))

   =>

   (assert (UI-state (display kids.query)
                     (relation-asserted kids)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule thrills-rule ""

   (logical (kids Yes))

   =>

   (assert (UI-state (display thrills.query)
                     (relation-asserted thrills)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule criminal-rule ""

   (logical (adventure No))

   =>

   (assert (UI-state (display criminal.query)
                     (relation-asserted criminal)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule diatribes-rule ""

   (logical (criminal Yes))

   =>

   (assert (UI-state (display diatribes.query)
                     (relation-asserted diatribes)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule drugs-rule ""

   (logical (diatribes No))

   =>

   (assert (UI-state (display drugs.query)
                     (relation-asserted drugs)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule hiphop-rule ""

   (logical (drugs No))

   =>

   (assert (UI-state (display hiphop.query)
                     (relation-asserted hiphop)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule mobstory-rule ""

   (logical (drugs Yes))

   =>

   (assert (UI-state (display mobstory.query)
                     (relation-asserted mobstory)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule romance-rule ""

   (logical (criminal No))

   =>

   (assert (UI-state (display romance.query)
                     (relation-asserted romance)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule rape-rule ""

   (logical (romance No))

   =>

   (assert (UI-state (display rape.query)
                     (relation-asserted rape)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule dragontattoo-rule ""

   (logical (rape No))

   =>

   (assert (UI-state (display dragontattoo.query)
                     (relation-asserted dragontattoo)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule fireplay-rule ""

   (logical (dragontattoo Yes))

   =>

   (assert (UI-state (display fireplay.query)
                     (relation-asserted fireplay)
                     (response Yes)
                     (valid-answers Yes No)))) 

(defrule confusion-rule ""

   (logical (rape Yes))

   =>

   (assert (UI-state (display confusion.query)
                     (relation-asserted confusion)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule subtitles2-rule ""

   (logical (confusion No))

   =>

   (assert (UI-state (display subtitles2.query)
                     (relation-asserted subtitles2)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule mellow-rule ""

   (logical (subtitles2 Yes))

   =>

   (assert (UI-state (display mellow.query)
                     (relation-asserted mellow)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule tommatt-rule ""

   (logical (romance Yes))

   =>

   (assert (UI-state (display tommatt.query)
                     (relation-asserted tommatt)
                     (response Tom)
                     (valid-answers Tom Matt))))

;;;****************
;;;* FINAL RULES *
;;;****************           
           
(defrule terminator-yes ""

   (logical (terminator Yes))

   =>

   (assert (UI-state (display terminator.answer)
                     (state final))))                   

(defrule war-yes ""

   (logical (war Yes))

   =>

   (assert (UI-state (display black.hawk.answer)
                     (state final))))                 

(defrule oldschool-old ""

   (logical (oldschool Old))

   =>

   (assert (UI-state (display time.west.answer)
                     (state final))))              

(defrule oldschool-fresh ""

   (logical (oldschool Fresh))

   =>

   (assert (UI-state (display true.grit.answer)
                     (state final))))       

(defrule serious-no ""

   (logical (serious No))

   =>

   (assert (UI-state (display top.gun.answer)
                     (state final))))   

(defrule future-future ""

   (logical (future Future))

   =>

   (assert (UI-state (display aeon.flux.answer)
                     (state final))))   

(defrule future-now ""

   (logical (future Now))

   =>

   (assert (UI-state (display shooter.answer)
                     (state final))))   

(defrule snowboard-yes ""

   (logical (snowboard Yes))

   =>

   (assert (UI-state (display flight.art.answer)
                     (state final))))   

(defrule facemelted-yes ""

   (logical (facemelted Yes))

   =>

   (assert (UI-state (display horse.year.answer)
                     (state final))))

(defrule painpaint-pain ""

   (logical (painpaint Pain))

   =>

   (assert (UI-state (display bones.brigade.answer)
                     (state final))))

(defrule painpaint-paint ""

   (logical (painpaint Paint))

   =>

   (assert (UI-state (display gift.shop.answer)
                     (state final))))

(defrule religion-yes ""

   (logical (religion Yes))

   =>

   (assert (UI-state (display religulous.answer)
                     (state final))))

(defrule woodyallen-yes ""

   (logical (woodyallen Yes))

   =>

   (assert (UI-state (display woody.allen.answer)
                     (state final))))

(defrule subtitles-yes ""

   (logical (subtitles Yes))

   =>

   (assert (UI-state (display grizzly.answer)
                     (state final))))

(defrule subtitles-no ""

   (logical (subtitles No))

   =>

   (assert (UI-state (display wire.man.answer)
                     (state final))))

(defrule chainsaw-yes ""

   (logical (chainsaw Yes))

   =>

   (assert (UI-state (display evil.dead.answer)
                     (state final))))

(defrule horror-yes ""

   (logical (horror Yes))

   =>

   (assert (UI-state (display cabin.answer)
                     (state final))))

(defrule asylums-yes ""

   (logical (asylums Yes))

   =>

   (assert (UI-state (display session.answer)
                     (state final))))

(defrule asylums-no ""

   (logical (asylums No))

   =>

   (assert (UI-state (display insidious.answer)
                     (state final))))
                     
(defrule clever-no ""

   (logical (clever No))

   =>

   (assert (UI-state (display duck.soup.answer)
                     (state final))))
                     
(defrule clever-yes ""

   (logical (clever Yes))

   =>

   (assert (UI-state (display ferris.answer)
                     (state final))))
                     
(defrule breakout-yes ""

   (logical (breakout Yes))

   =>

   (assert (UI-state (display happy.gilmore.answer)
                     (state final))))
                     
(defrule lewd-more ""

   (logical (lewd More))

   =>

   (assert (UI-state (display clerks.answer)
                     (state final))))
                     
(defrule lewd-less ""

   (logical (lewd Less))

   =>

   (assert (UI-state (display manhattan.answer)
                     (state final))))
                     
(defrule greatlegendary-great ""

   (logical (greatlegendary Great))

   =>

   (assert (UI-state (display slap.shot.answer)
                     (state final))))
                     
(defrule greatlegendary-legend ""

   (logical (greatlegendary Legend))

   =>

   (assert (UI-state (display butch.cassidy.answer)
                     (state final))))
                     
(defrule grittypretty-gritty ""

   (logical (grittypretty Gritty))

   =>

   (assert (UI-state (display trainspotting.answer)
                     (state final))))
                     
(defrule romanticindie-yes ""

   (logical (romanticindie Yes))

   =>

   (assert (UI-state (display translation.lost.answer)
                     (state final))))
                     
(defrule romanticindie-no ""

   (logical (romanticindie No))

   =>

   (assert (UI-state (display big.fish.answer)
                     (state final))))
                     
(defrule firefly-yes ""

   (logical (firefly Yes))

   =>

   (assert (UI-state (display serenity.answer)
                     (state final))))
                    
(defrule kids-no ""

   (logical (kids No))

   =>

   (assert (UI-state (display star.trek.answer)
                     (state final))))
                    
(defrule thrills-no ""

   (logical (thrills No))

   =>

   (assert (UI-state (display hunger.games.answer)
                     (state final))))
                    
(defrule thrills-yes ""

   (logical (thrills Yes))

   =>

   (assert (UI-state (display super8.answer)
                     (state final))))
                    
(defrule diatribes-yes ""

   (logical (diatribes Yes))

   =>

   (assert (UI-state (display reservoir.dogs.answer)
                     (state final))))
                    
(defrule hiphop-yes ""

   (logical (hiphop Yes))

   =>

   (assert (UI-state (display hustle.flow.answer)
                     (state final))))
                    
(defrule hiphop-no ""

   (logical (hiphop No))

   =>

   (assert (UI-state (display traffic.answer)
                     (state final))))
                    
(defrule mobstory-yes ""

   (logical (mobstory Yes))

   =>

   (assert (UI-state (display millers.crossing.answer)
                     (state final))))
                    
(defrule mobstory-no ""

   (logical (mobstory No))

   =>

   (assert (UI-state (display clay.pigeons.answer)
                     (state final))))
                    
(defrule fireplay-no ""

   (logical (fireplay No))

   =>

   (assert (UI-state (display fire.girl.answer)
                     (state final))))
                    
(defrule fireplay-yes ""

   (logical (fireplay Yes))

   =>

   (assert (UI-state (display hornet.girl.answer)
                     (state final))))
                    
(defrule dragontattoo-no ""

   (logical (dragontattoo No))

   =>

   (assert (UI-state (display dragon.girl.answer)
                     (state final))))
                    
(defrule confusion-yes ""

   (logical (confusion Yes))

   =>

   (assert (UI-state (display pi.answer)
                     (state final))))
                    
(defrule subtitles2-no ""

   (logical (subtitles2 No))

   =>

   (assert (UI-state (display tomboy.answer)
                     (state final))))
                    
(defrule mellow-no ""

   (logical (mellow No))

   =>

   (assert (UI-state (display machinist.answer)
                     (state final))))
                    
(defrule mellow-yes ""

   (logical (mellow Yes))

   =>

   (assert (UI-state (display midnight.cowboy.answer)
                     (state final))))
                    
(defrule tommatt-tom ""

   (logical (tommatt Tom))

   =>

   (assert (UI-state (display vanilla.sky.answer)
                     (state final))))
                    
(defrule tommatt-matt ""

   (logical (tommatt Matt))

   =>

   (assert (UI-state (display good.will.hunging.answer)
                     (state final))))


;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))