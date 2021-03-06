clear
close all
clc

subcat.c11 = [8, 19, 71, 127, 442, 504];
subcat.c12 = [106,118, 401, 427];
subcat.c13 = [48, 55, 95, 96];
subcat.c14 = [534, 536, 540, 544, 546, 548, 549, 552, 554, 556, 558, 560, 562, ...
    564, 568, 570];
subcat.c15 = [520, 521, 522, 523, 524, 525, 526, 527, 528, 530];
subcat.c19 = [23, 34, 44, 102, 117, 149, 156, 159, 162, 196, 201, 202, 203, ...
    204, 205, 208, 210, 216, 222, 252, 260, 261, 349, 366, 416, 422, ...
    423, 430, 436, 494, 501, 502, 510, 512, 516, 518, 585, 588];
subcat.c21 = [178, 333, 340, 342, 343, 358, 367, 370, 375, 379, 385, 455];
subcat.c22 = [341, 380, 382, 395, 700, 701, 702, 704, 705, 706, 707, 708, ...
    709, 710, 712, 713, 714];
subcat.c23 = [345, 347];
subcat.c24 = [360, 365, 369, 711];
subcat.c31 = [424, 514];
subcat.c32 = [128, 600, 601, 602, 604, 606, 607];
subcat.c33 = [435, 800];
subcat.c39 = [351, 433, 623];
subcat.c41 = [174, 200, 327, 329, 330, 331, 332, 334, 335, 336, 337, 338, 392, 439];
subcat.c42 = [313, 314, 315, 362, 372, 445];
subcat.c43 = [73, 324, 356, 374];
subcat.c44 = [250, 376, 378];
subcat.c45 = [60, 136, 290, 310, 318, 320, 322, 323, 361, 363, 388, 429];
subcat.c46 = [257, 326, 438, 505];
subcat.c49 = [191, 218, 219];
subcat.c51 = [65, 82, 83, 125, 141, 142, 144, 173, 209, 221, 225, 226, 234, 241, ...
    242, 264, 271, 407, 408, 409, 414, 425, 451, 493];
subcat.c52 = [29, 72, 75, 76, 140, 147, 148, 163, 164, 228, 266, 270, 413, ...
    419, 420];
subcat.c53 = [91, 92, 123, 185, 188, 192, 251, 303, 415, 417, 418, 464, 474, ...
    475, 476, 477];
subcat.c54 = [352, 353, 355, 359, 396, 399];
subcat.c55 = [104, 105, 114, 152, 180, 187, 213, 238, 244, 246, 258, 280, ...
    293, 295, 296, 298, 301, 305, 410, 440];
subcat.c59 = [7, 16, 42, 49, 51, 74, 81, 86, 89, 100, 124, 157, 184, 193, 194, ...
    198, 212, 227, 235, 239, 254, 267, 291, 294, 384, 400, 402, 406, 411, ...
    453, 454, 470, 482, 483, 492, 508];
subcat.c61 = [43, 47, 56, 99, 111, 119, 131, 426, 449, 452, 460];
subcat.c62 = [273, 446, 463, 472, 473];
subcat.c63 = [2, 12, 24, 26, 28, 36, 38, 57, 66, 68, 69, 79, 87, 112, 139, 223, 450];
subcat.c64 = [37, 166, 171, 172, 175, 299, 405, 507];
subcat.c65 = [4, 5, 30, 70, 132, 182, 211, 256, 297, 312];
subcat.c66 = [110, 122, 126, 165, 237, 373, 431, 432];
subcat.c67 = [138, 277, 285, 403];
subcat.c68 = [53, 206, 215, 217, 220, 224, 229, 232, 383];
subcat.c69 = [1, 14, 15, 27, 33, 40, 52, 54, 59, 62, 63, 84, 101, 108, 109, 116, ...
    134, 135, 137, 150, 160, 168, ...
    169, 177, 181, 186, 190, 199, 231, 236, 245, 248, 249, 269, ...
    276, 278, 279, 281, 283, 289, 292, 300, 368, 404, 412, 428, 434, 441, 462, 503];


subCodes = fieldnames(subcat);
crosswalk = [];

for i = 1:length(subCodes)
    valName = subCodes{i};
    code = str2num(valName(end-1:end));
    vals = subcat.(subCodes{i});
    
    crosswalk = [crosswalk;
                repmat(code, length(vals), 1), vals'];
end

% Check some test cases
assert(crosswalk(find(crosswalk(:, 2) == 138), 1) == 67)
assert(crosswalk(find(crosswalk(:, 2) == 360), 1) == 24)
assert(crosswalk(find(crosswalk(:, 2) == 8), 1) == 11)
assert(crosswalk(find(crosswalk(:, 2) == 503), 1) == 69)
assert(crosswalk(find(crosswalk(:, 2) == 414), 1) == 51)
assert(crosswalk(find(crosswalk(:, 2) == 600), 1) == 32)

save('crosswalk.mat', 'crosswalk')
