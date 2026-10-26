mydata <- rep(letters[seq_len(3L)], c(100L, 200L, 300L))

res <- freqCI(mydata, level = c(0.95, 0.99))
res_check <- structure(list(call = quote(freqCI(x = mydata, level = c(0x1.e666666666666p-1, 0x1.fae147ae147aep-1))), x = rep(letters[seq_len(3L)], c(100L, 200L, 300L)), level = c(0x1.e666666666666p-1, 0x1.fae147ae147aep-1), freq = structure(c(a = 100L, b = 200L, c = 300L), dim = 3L, dimnames = list(x = c("a", "b", "c"))), n = 600L, rel_freq = c(0x1.5555555555555p-3, 0x1.5555555555555p-2, 0x1p-1), cat_names = c("a", "b", "c"), CIs_low = structure(c(0x1.05127d445f6bp-3, 0x1.22925e40a900bp-2, 0x1.ca28c20dba5edp-2, 0x1.18431dc8df3c2p-3, 0x1.2eb562e5450a8p-2, 0x1.d7083f97f80f2p-2), dim = 3:2), CIs_high = structure(c(0x1.92678ce1cb6e8p-3, 0x1.7bf547c565a02p-2, 0x1.147be03403f87p-1, 0x1.a5982d664b3fap-3, 0x1.88184c6a01a9fp-2, 0x1.1aeb9ef922d09p-1), dim = 3:2)), class = "freqCI") # nolint

resmat <- print(res, percent = FALSE, digits = 3L)
resmat_check <- structure(c(0x1.05127d445f6bp-3, 0x1.22925e40a900bp-2, 0x1.ca28c20dba5edp-2, 0x1.18431dc8df3c2p-3, 0x1.2eb562e5450a8p-2, 0x1.d7083f97f80f2p-2, 0x1.5555555555555p-3, 0x1.5555555555555p-2, 0x1p-1, 0x1.92678ce1cb6e8p-3, 0x1.7bf547c565a02p-2, 0x1.147be03403f87p-1, 0x1.a5982d664b3fap-3, 0x1.88184c6a01a9fp-2, 0x1.1aeb9ef922d09p-1), dim = c(3L, 5L), dimnames = list(c("a", "b", "c"), c("   0.005", "   0.025", "Estimate", "   0.975", "   0.995"))) # nolint

x_coo <- barplot(res)
x_coo_check <- c(0x1.6666666666666p-1, 0x1.e666666666666p+0, 0x1.8ccccccccccccp+1) # nolint

###

test_that("Check: freqCI", {
  expect_equal(res,    res_check)
  expect_equal(resmat, resmat_check)
  expect_equal(x_coo,  x_coo_check)
})
