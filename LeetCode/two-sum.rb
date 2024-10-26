# O(n²) time complexity indicates that an algorithm’s performance is proportional to the square of the input size, 𝑛.
# As 𝑛 grows, the runtime increases at a rate of 𝑛 × 𝑛, or n²
# This is commonly found in algorithms where each element in a dataset is compared with every other element, like:
# Nested Loops: Commonly occurs in algorithms with nested loops, where the outer loop runs
# 𝑛 times, and the inner loop runs 𝑛 times for each iteration of the outer loop. For example:
# for i in range(n):
#     for j in range(n):
#         # Some constant time operation
# Bubble Sort and Selection Sort: In sorting algorithms like bubble sort or selection sort,
# each element is repeatedly compared with others, resulting in O(n²) complexity.
# Matrix Multiplication: Multiplying two 𝑛 × 𝑛 matrices requires n².
# operations for each element in the result, yielding an overall O(n²) complexity.

# Algorithms with O(n²) complexity are inefficient for large inputs, as the performance degrades significantly
# as 𝑛 grows.

require 'benchmark'
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums.each_with_index do |num, index|
    (1...nums.length).each do |inner_index|
      next if index == inner_index
      return [index, inner_index] if num + nums[inner_index] == target
    end
  end
end

# ChatGpt solution
def two_sum_gpt(nums, target)
  num_to_index = {}

  nums.each_with_index do |num, index|
    complement = target - num
    if num_to_index.key?(complement)
      return [num_to_index[complement], index]
    end
    num_to_index[num] = index
  end
end

nums = (1..1_000).to_a
target = 1_500

Benchmark.bm do |x|
  x.report("two_sum") { two_sum(nums, target) }
  x.report("two_sum_gpt") { two_sum_gpt(nums, target) }
end

# OUTPUT

#              user       system     total       real
# two_sum      0.026247   0.000259   0.026506   (0.027023)
# two_sum_gpt  0.000149   0.000004   0.000153   (0.000157)

# With my solution 'Time Limit Exceeded'
