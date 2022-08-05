#### Name: Krishna Dudani
#### Name: PARTNER NAME (or remove line)
#### Class Period: 10

# Genetic Algorithm Rocket Design

### Adopting Existing Classes
#### What parts of `Gene`, `Individual` and `Population` can be used exactly as they already are written? Why?


#### What parts of `Gene`, `Individual` and `Population` will need to be modified? How will you modify them?
The part of Gene that needs to be modified is the size of each gene. the length of the color genes may remain 8 because the max values for those genes is still 255, but other things must be modified to make a rocket.
For Individual, instead of regulargon, triangle gon should be used to make a rocket. Fitness calculations must be changed such that it matches the new gene lengths of genes in a chromosome (which would thus change the maximum value each gene can output).
### Encoding Moves
How are you going to use `Gene` objects to encode the angles and magnitudes of each move?
the max

### Driver
How is the main driver file going to differ from the regulargon version?
It will likely be very much the same.
