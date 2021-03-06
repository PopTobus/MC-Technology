// --- Created by DarknessShadow ---
// --- InfiTech2 script for OpenComputers ---

import mods.ic2.Compressor;
import mods.ic2.Macerator;
import mods.gregtech.ChemicalReactor;
import mods.gregtech.Assembler;

# Aliases

var conduitBinder   = <EnderIO:itemMaterial:1>;

var chamelium       = <OpenComputers:item:96>;
var chameliumBlock  = <OpenComputers:chameliumBlock>;
var ChipTier3       = <OpenComputers:item:26>;
var PrintedBoard    = <OpenComputers:item:32>;
var CuttingWire     = <OpenComputers:item:17>;
var RawBoard		= <OpenComputers:item:30>;
var CircuitBoard    = <OpenComputers:item:31>;
var CUnit           = <OpenComputers:item:28>;
var Analyzer        = <OpenComputers:item>;
var ElectronicsAssembler = <OpenComputers:assembler>;
var Disassembler    = <OpenComputers:disassembler>;

var AdvAssemblerII     = <gregtech:gt.blockmachines:213>;
var TungstensteelPlate = <ore:plateTungstenSteel>;
var pistonElectricHV   = <gregtech:gt.metaitem.01:32642>;
var EmptyBoard         = <gregtech:gt.metaitem.01:32719>;
var EtchedHV           = <gregtech:gt.metaitem.01:32717>;
var RoboArmHV          = <gregtech:gt.metaitem.01:32652>;
var AdvDisassembler    = <gregtech:gt.blockmachines:452>;



// added from enderio.zs
var OCCable = <OpenComputers:cable>;
var OCConduit = <EnderIO:itemOCConduit>;

# Recipe Tweaks

recipes.removeShaped(chameliumBlock);
recipes.removeShapeless(chamelium);
Compressor.addRecipe(chameliumBlock, chamelium * 9);
Macerator.addRecipe( chamelium * 9, chameliumBlock);

// added from enderio.zs
recipes.remove(OCConduit);
recipes.addShaped(OCConduit * 3, [
    [conduitBinder, conduitBinder, conduitBinder],
    [OCCable, OCCable, OCCable],
    [conduitBinder, conduitBinder, conduitBinder]]);

//Generator Upgrade
recipes.remove(<OpenComputers:item:15>);
recipes.addShaped(<OpenComputers:item:15>, [
    [<ore:screwStainlessSteel>, <OpenComputers:item:32>, <ore:screwStainlessSteel>],
    [<OpenComputers:item:25>, <gregtech:gt.metaitem.01:32600>, <OpenComputers:item:25>],
    [<ore:screwStainlessSteel>, <ore:craftingToolScrewdriver>, <ore:screwStainlessSteel>]]);

	
// Electronics Assembler
recipes.remove(ElectronicsAssembler);
recipes.addShaped(ElectronicsAssembler, [
[TungstensteelPlate, AdvAssemblerII, TungstensteelPlate],
[pistonElectricHV, ChipTier3, pistonElectricHV],
[TungstensteelPlate, PrintedBoard, TungstensteelPlate]]);

//Cutting Wire
recipes.remove(CuttingWire);

//Raw Circuit Board
recipes.remove(RawBoard);

//Circuit Board
furnace.remove(CircuitBoard);
ChemicalReactor.addRecipe(CircuitBoard, null, EmptyBoard, null, <liquid:dye.chemical.dyegreen> * 144, 200);

//Printed Circuit Board
recipes.remove(PrintedBoard);
Assembler.addRecipe(PrintedBoard, CircuitBoard, EtchedHV, <liquid:sulfuricacid> * 1000, 400, 90);

//Disassembler
recipes.remove(Disassembler);
recipes.addShaped(Disassembler, [
[CUnit, <minecraft:stained_glass_pane:15>, Analyzer],
[pistonElectricHV, AdvDisassembler, RoboArmHV],
[TungstensteelPlate, PrintedBoard, TungstensteelPlate]]);











