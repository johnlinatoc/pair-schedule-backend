require "user.rb"
require "json"

class Schedule < ApplicationRecord
    has_many :users
    @@sprints = ["hi"]

    def exam
        puts @@sprints
    end

    def create_schedule
        #grab all users
        #create sprints

        #what happens if a new sprint is added?
        #call create schedule again inside of create sprint
        developers = []
        User.all.each {|user| developers.push(user.name)}
        pairs = {}
        weeks = self.weeks

        # puts developers
        if developers.length % 2 === 0 
            evenNumDevs(developers, pairs, weeks)
        else
            oddNumDevs(developers, pairs, weeks)
        end
    end

    def oddNumDevs(developers, pairs, weeks)
        sprint = 1

        while sprint <= weeks
            current_sprint = "sprint #{sprint}"
            pairs[current_sprint] = []
            count = 0
            last_dev = developers.last

            first_devs = developers[0...developers.length/2]
            last_devs = (developers[(developers.length/2), first_devs.length]).reverse

            while count < first_devs.length
                pairs[current_sprint].push([first_devs[count], last_devs[count]])
                count += 1
            end

            pairs[current_sprint].push([last_dev])

            developers.unshift(last_dev)
            developers.pop
            sprint += 1
        end
        JSON.generate(pairs)
    end

    def evenNumDevs(developers, pairs, weeks)
        sprint = 1
        firstDev = developers[0]
        allDevsExceptFirst = developers[1..-1]
        puts allDevsExceptFirst

        # const evenNumDevs = (developers, pairs, weeks) => {
            #       let sprint = 1
                
            #       const firstDev = developers[0];
            #       const allDevsExceptFirst = developers.slice(1)
                  
            #       while(sprint <= weeks){
            #       let currentSprint = `sprint ${sprint}`;
            #       pairs[currentSprint] = []; 
            #         let count = 0;
            #         const sprintPairs = {};
            #         const lastDev = allDevsExceptFirst[allDevsExceptFirst.length - 1];
                
            #         let arr1 = allDevsExceptFirst.slice(0, allDevsExceptFirst.length/2);
            #         let arr2 = allDevsExceptFirst.slice(allDevsExceptFirst.length/2, allDevsExceptFirst.length).reverse();
            #         arr1.unshift(firstDev);
                
            #         while(count < arr1.length){
            #           pairs[currentSprint].push([arr1[count], arr2[count]])
            #           count++;
            #         }
                
            #         //remove added in 
            #         arr1.shift();
            #          //to move last dev to the front of the line
            #         allDevsExceptFirst.pop();
            #         allDevsExceptFirst.unshift(lastDev);
                
            #         sprint++;
            #       }
    end

end

# const createPairs = () => {
#     const developers = obj.developers;
#     const pairs = {};
#     const weeks = (obj.projectDurationMonths) * 4;
    
#       if (developers.length % 2 === 0){
#         evenNumDevs(developers, pairs, weeks);
#       } else {
#         oddNumDevs(developers, pairs, weeks);
#       }
    
#     console.log(JSON.stringify(pairs));
#     }
    
#     const oddNumDevs = (developers, pairs, weeks) => {
#     let sprint = 1;
    
#     while(sprint <= weeks){
#         let currentSprint = `sprint ${sprint}`;
#         pairs[currentSprint] = []; 
#         let count = 0;
#         const sprintPairs = {};
#         const lastDev = developers[developers.length - 1];
    
#         let arr1 = developers.slice(0, developers.length/2);
#         let arr2 = developers.slice(developers.length/2, developers.length-1).reverse();
    
#         while(count < arr1.length){
#           pairs[currentSprint].push([arr1[count], arr2[count]])
#           count++;
#         }
    
#         pairs[currentSprint].push([lastDev])
    
#         //to move last dev to the front of the line
#         developers.unshift(lastDev);
#         obj.developers.pop();
    
#         sprint++;
#       };
    
#     }
    
#     const evenNumDevs = (developers, pairs, weeks) => {
#       let sprint = 1
    
#       const firstDev = developers[0];
#       const allDevsExceptFirst = developers.slice(1)
      
#       while(sprint <= weeks){
#       let currentSprint = `sprint ${sprint}`;
#       pairs[currentSprint] = []; 
#         let count = 0;
#         const sprintPairs = {};
#         const lastDev = allDevsExceptFirst[allDevsExceptFirst.length - 1];
    
#         let arr1 = allDevsExceptFirst.slice(0, allDevsExceptFirst.length/2);
#         let arr2 = allDevsExceptFirst.slice(allDevsExceptFirst.length/2, allDevsExceptFirst.length).reverse();
#         arr1.unshift(firstDev);
    
#         while(count < arr1.length){
#           pairs[currentSprint].push([arr1[count], arr2[count]])
#           count++;
#         }
    
#         //remove added in 
#         arr1.shift();
#          //to move last dev to the front of the line
#         allDevsExceptFirst.pop();
#         allDevsExceptFirst.unshift(lastDev);
    
#         sprint++;
#       }
#     }
    
#     createPairs();