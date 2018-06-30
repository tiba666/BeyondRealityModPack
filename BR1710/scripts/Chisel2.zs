// Chisel2.zs Tweaks
import mods.gregtech.CuttingSaw;
import mods.chisel.Groups;
import minetweaker.oredict.IOreDictEntry;

# Ingredients
val toolSaw = <ore:craftingToolSaw> * 0;
val water = <liquid:water>;
val distilledWater = <liquid:ic2distilledwater>;
val lubricant = <liquid:lubricant>;

# Foreign Items
val dustMarble = <gregtech:gt.metaitem.01:2845>;
val plateMarble = <gregtech:gt.metaitem.01:17845>;

# Global vars

var item = <minecraft:stone>;
var group = "groupname";
var groupEntry = <ore:stone>;

for meta in [0, 1, 2, 3, 4, 5] as int[] {
  item = <chisel:thaumium>.definition.makeStack(meta);
  <ore:blockThaumium>.add(item);
}

// Andesite
group = "andesite";
groupEntry = <ore:stoneAndesite>;
for meta, entry in [
  <ore:stoneAndesite>,
  <ore:stoneAndesitePolished>,
  <ore:stoneAndesitePillar>,
  <ore:stoneAndesiteBricks>,
  <ore:stoneAndesiteChiseled>,
  <ore:stoneAndesitePrismatic>,
  <ore:stoneAndesiteTilesSmall>
] as IOreDictEntry[] {
  item = <chisel:andesite>.definition.makeStack(meta);
  entry.add(item);
  groupEntry.add(item);
}

Groups.removeGroup(group); // reset groupe to remove duplicates
Groups.addGroup(group);
for item in groupEntry.items {
  Groups.addVariation(group, item);
}

// Diorites

group = "diorite";
groupEntry = <ore:stoneDiorite>;

Groups.removeGroup(group);
Groups.addGroup(group);
for meta, entry in [
  <ore:stoneDiorite>,
  <ore:stoneDioritePolished>,
  <ore:stoneDioritePillar>,
  <ore:stoneDioriteBricks>,
  <ore:stoneDioriteChiseled>,
  <ore:stoneDioritePrismatic>,
  <ore:stoneDioriteTilesSmall>
] as IOreDictEntry[] {
  item = <chisel:diorite>.definition.makeStack(meta);
  entry.add(item);
  groupEntry.add(item);
}

Groups.removeGroup(group);
Groups.addGroup(group);
for item in groupEntry.items {
  Groups.addVariation(group, item);
}

for meta in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] as int[] {
  var stoneMarble = <chisel:marble>.definition.makeStack(meta);
  var stoneMarblePillar = <chisel:marble_pillar>.definition.makeStack(meta);
  var stoneLime = <chisel:limestone>.definition.makeStack(meta);
  var slabStoneMarble = <chisel:marble_slab>.definition.makeStack(meta);
  var slabStoneMarblePillar = <chisel:marble_pillar_slab>.definition.makeStack(meta);
  var slabStoneLime = <chisel:limestone_slab>.definition.makeStack(meta);

  // Ore registrations
  <ore:stoneMarble>.add(stoneMarble);
  <ore:stoneMarble>.add(stoneMarblePillar);
  <ore:stoneLime>.add(stoneLime);
  <ore:slabStoneMarble>.add(slabStoneMarble);
  <ore:slabStoneMarble>.add(slabStoneMarblePillar);
  <ore:slabStoneLime>.add(slabStoneLime);
  <ore:stoneMarblePillar>.add(stoneMarblePillar);
  <ore:slabStoneMarblePillar>.add(slabStoneMarblePillar);

  // 2 Slabs from block with Saw
  recipes.addShaped(slabStoneMarble * 2, [[toolSaw, stoneMarble]]);
  recipes.addShaped(slabStoneMarblePillar * 2, [[toolSaw, stoneMarblePillar]]);
  recipes.addShaped(slabStoneLime * 2, [[toolSaw, stoneLime]]);

  // 2 Slabs from block in CuttingSaw
  CuttingSaw.addRecipe([slabStoneMarble * 2], stoneMarble, water, 50, 8);
  CuttingSaw.addRecipe([slabStoneMarble * 2], stoneMarble, distilledWater, 50, 8);
  CuttingSaw.addRecipe([slabStoneMarble * 2], stoneMarble, lubricant, 25, 8);
  CuttingSaw.addRecipe([slabStoneMarblePillar * 2], stoneMarblePillar, water, 50, 8);
  CuttingSaw.addRecipe([slabStoneMarblePillar * 2], stoneMarblePillar, distilledWater, 50, 8);
  CuttingSaw.addRecipe([slabStoneMarblePillar * 2], stoneMarblePillar, lubricant, 25, 8);
  CuttingSaw.addRecipe([slabStoneLime * 2], stoneLime, water, 50, 8);
  CuttingSaw.addRecipe([slabStoneLime * 2], stoneLime, distilledWater, 50, 8);
  CuttingSaw.addRecipe([slabStoneLime * 2], stoneLime, lubricant, 25, 8);

  // 2 plateMarble from slabStoneMarble in CuttingSaw
  CuttingSaw.addRecipe([plateMarble * 2], slabStoneMarble, water, 64, 8);
  CuttingSaw.addRecipe([plateMarble * 2], slabStoneMarble, distilledWater, 64, 8);
  CuttingSaw.addRecipe([plateMarble * 2], slabStoneMarble, lubricant, 32, 8);
  CuttingSaw.addRecipe([plateMarble * 2], slabStoneMarblePillar, water, 64, 8);
  CuttingSaw.addRecipe([plateMarble * 2], slabStoneMarblePillar, distilledWater, 64, 8);
  CuttingSaw.addRecipe([plateMarble * 2], slabStoneMarblePillar, lubricant, 32, 8);
}

// Add Gregtech Thaumium block to chisel groups so it can be crafted as needed
Groups.addVariation("thaumium", <gregtech:gt.blockmetal7:4>);

// Marbles

group = "marble";
Groups.removeGroup(group);
Groups.addGroup(group);
for entry in [
  <ore:stoneMarble>
] as IOreDictEntry[] {
  for item in entry.items {
    Groups.addVariation(group, item);
  }
}

// Basalts

group = "basalt";
Groups.addGroup(group);
for entry in [
  <ore:stoneBasalt>,
  <ore:stoneBasaltBricks>,
  <ore:stoneBasaltPolished>
] as IOreDictEntry[] {
  for item in entry.items {
    Groups.addVariation(group, item);
  }
}

Groups.addGroup("basalt_slab");
Groups.addGroup("basalt_stairs");

// Granites
group = "granite";
for entry in [
  <ore:stoneGranite>,
  <ore:stoneGranitePolished>,
  <ore:stoneGraniteBricks>,
  <ore:stoneGraniteChiseled>
] as IOreDictEntry[] {
  for item in entry.items {
    Groups.addVariation(group, item);
  }
}

// Black Granite group

group = "blackgranite";
Groups.addGroup(group);
for item in <ore:stoneGraniteBlack>.items {
  Groups.addVariation(group, item);
}

// Red Granite group

group = "redgranite";
Groups.addGroup(group);
for item in <ore:stoneGraniteRed>.items {
  Groups.addVariation(group, item);
}

