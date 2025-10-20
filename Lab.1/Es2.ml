(* 

  Ferro Manuele
  Programming Language | Lab. 1 Es. 2
  20/10/2025

  ---
  Beyond the well-known Celsius and Fahrenheit, there are other six temperature scales: Kelvin, Rankine, Delisle, Newton, Réaumur, and Rømer (Look at:
  http://en.wikipedia.org/wiki/Comparison_of_temperature_scales
  to read about them).
      Write a function that given a pure number returns a conversion table for it among any of the 8 scales.
      Write a function that given a temperature in a specified scale returns a list of all the corresponding temperatures in the other scales, note that the scale must be specified.
  Hint. Define a proper datatype for the temperature.
  ---
*)
type scala = Celsius | Fahrenheit | Reamur | Kelvin | Rankine | Delisle | Newton | Romer;;
let scalaToString = function
| Celsius -> "Celsius"
| Fahrenheit -> "Fahrenheit"
| Reamur -> "Reamur"
| Kelvin -> "Kelvin"
| Rankine -> "Rankine"
| Delisle -> "Delisle"
| Newton -> "Newton"
| Romer -> "Romer"
type temperatura = {scala: scala; valore: float}(* Usiamo come base per tutto i celsius, tutte le conversioni passano di li! *)

let toCel t = match t with
| {scala = Celsius} -> {scala=Celsius; valore= t.valore}
| {scala = Fahrenheit} -> {scala = Celsius; valore = (t.valore -. 32.0) *. (5.0 /. 9.0) }
| {scala = Reamur} -> {scala= Celsius; valore = (t.valore *. 5.0 /. 4.0)}
| {scala = Kelvin} -> {scala= Celsius; valore = t.valore -. 273.15}
| {scala = Rankine} -> {scala= Celsius; valore = (t.valore -. 491.67) *. (5.0 /. 9.0)}
| {scala = Delisle} -> {scala= Celsius; valore = (100. +. t.valore ) *. (3.0 /. 2.0)}
| {scala = Newton} -> {scala= Celsius; valore = t.valore *. 100.0 /. 33.0 }
| {scala = Romer} -> {scala= Celsius; valore = (t.valore -. 7.5) *. (40.0 /. 21.0)};;

let fromCel valore scala  = match scala with
| Celsius -> {scala=Celsius; valore= valore}
| Fahrenheit -> {scala = Celsius; valore = valore  *. (9.0 /. 5.0) +. 32.0}
| Reamur -> {scala= Celsius; valore = (valore /. 5.0 *. 4.0)}
| Kelvin -> {scala= Celsius; valore = valore +. 273.15}
| Rankine -> {scala= Celsius; valore = (valore +. 273.15) *. (9.0 /. 5.0)}
| Delisle -> {scala= Celsius; valore = (100. -. valore ) *. (3.0 /. 2.0)}
| Newton -> {scala= Celsius; valore = valore *. 33.0 /. 100.0 }
| Romer -> {scala= Celsius; valore = (valore  *. (21.0 /. 40.0) +. 7.5)};;

(* Da un numero puro a tutte le varie tabelle *)
let daPuroATutti numPuro = 
    let tutteScale = [Celsius ; Fahrenheit ; Reamur ; Kelvin ; Rankine ; Delisle ; Newton ; Romer] in 
    let tutteTemperature = List.map (fun x -> {scala = x; valore = numPuro}) tutteScale in
    List.iter (fun x -> 
      Printf.printf "\n" ;
      Printf.printf "-------------------------------------------\n" ;
      Printf.printf "\t\t%s: %f\n" (scalaToString x.scala) x.valore;
      Printf.printf "-------------------------------------------\n" ;

      let c = toCel x in
      List.iter (fun y -> 
        Printf.printf "%s: %f\n" (scalaToString y) (fromCel c.valore y).valore
      ) tutteScale
    ) tutteTemperature;;
  
daPuroATutti(3.);;
