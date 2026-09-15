Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A56463B76
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456640; cv=none; b=Sb9yCU8ur6MgjvCswtuntT/wRVbqVJTiCvUBl4iGF7d+70sJ289Eka6N5MSNiLEtpAStbeRPu3bOgeCOfNb1pUtO6nYX5gUa9J+NujbzZm3VPOdQMcL02Eqk3kNFhQ6dy9ToSMViAT25GQjiXd4aO6Ma9wNwI5mqiGUUbVnQJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456640; c=relaxed/simple;
	bh=yq7S6R8PxPg8U1OJ/GAnLc0WhV4sKlaZgE74Pzvauug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbO1pBgUbNADZ7RMoKphGGUD6k9yGmN8dF953UBF9ThKJLutEH3ZOmuJsIjDaAP/InJCIhvwoILyOqC2MOmxjEpjJiY4U5nULA4f1XjTDRrE0qSGGUD6R4a8cwsKrMOzDy2zOEEFacFEFvrg1+NvLDktAaXayoh+Ovvi97hgCiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADnAiIUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZxMd97n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADnAiIUq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZxMd97n"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZAZk2983640
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qe2zzmLjAMpTnuktqaiYBaQR3/jluvVlK+0yiGzu5Pw=; b=ADnAiIUqoJBtN4E+
	Gk30HHfu7xuo6vpCUbR3A69DfiJ0x+KRsGI4ohhnf36p4L03l81APQlDy6v44u6z
	SgdVyxNqwX6meCpi9IOOQdEwcZgJS3cEn/+GU0sqdBNoKQn4CxdxN9AEOQk9/RBp
	I/3d6efiOhVRTfiHs2pH5ZwGe+thND8p4Qx+JYvyE9TGWVPiwYTkdtknpNsNkq5v
	w20ymBtrgDHc2JnqQ2aXeoxxcqvvN9FaojfyqOCpz2+DKfYXJ1DTpLuZnCynJwH6
	UaT7ZpfMpDQ+5+q7hxQGYiycz3gJOJyBpNtqLRc6IFrbwpNhSnBz/aN7TAFPd1aG
	EMx3wA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet2xn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:17:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39df742a3e3so998287a91.1
        for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 00:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456635; x=1790061435; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qe2zzmLjAMpTnuktqaiYBaQR3/jluvVlK+0yiGzu5Pw=;
        b=iZxMd97n74v/9UBerD/GPqqR162QJgdtmnMWJonj3mPerjetfWPLZbmXRltC2cZJlz
         9imN+fuWglSwI/mzj636hSOekPCBYt7K7UMy/4Z0a4wLCr5mg38Wfp1UQf3U3dQKM86l
         1fAGma8vvtfkix+NAOxoh2XDDLQTRmQBiRlPZVE80AzymA0fWadpTA4XWDiH918O4oTi
         0yNEBjedY4BqwOfnk/t+tk8RwVsAb+hJhPhdxeBLfdv42yrR4H8m9wQziRZpZrf5Sz2S
         SgEVINU0w/ojcPm5zawpAvAUjU3INdg2oRKCwegAGaQ3sYEdySpu9JUhUfjaxC5tV6wV
         d6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456635; x=1790061435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qe2zzmLjAMpTnuktqaiYBaQR3/jluvVlK+0yiGzu5Pw=;
        b=Cj2VefaL5HuV/1EHp25yEPVhM2ajoZOd5LQWfGMtSudLmTCTA3MR5rXW/CK/ltTJYI
         sAsRR+E4PIZy43fC4rP4joV2OhuGJxIiim6pO3BzXkchpTJJRfMJDaFG+U3wQeXFngmY
         Uwozc9/hVauINMcqk1rvL30m8v8DVibu7tg/e8NEZU9B1Jyr20agsSxb2X8zTChuP7Av
         rPUo9/b0GctLzy2fXWww+EBLP/J39y4a2Z7aEQYm2iqgpeNy8WZ/uhNIz7RAKTco5X3e
         tbAbjf8MffxCfoIRV6hh6I95qzYVcHoK6Uv3AVxNG1iPvQUj3361RIdlGhlUHaMLCJZN
         Gepg==
X-Forwarded-Encrypted: i=1; AKwUvBw2fGaCdEgV3Kn2Hrr3MEBUKtHSpCiHUk09SJAhPmfYyTYIAYtb+Eab2lBOwSd7piOPRrk84LbKWg==@lists.linux.dev
X-Gm-Message-State: AFuF++k1twFBuKxzIdUJhklTDbKTkI8FSUvByr6QPpqFUp/dI4TWv9a2
	X1+uByD0zs/+89wcN4KN87bs47hSzes40+hpqlvV62oUK9HIArdWhk8NJNCJ6h/2sksHvgxsMHE
	05AoAWbE/L8j8/VbTdbIDldynyTRKgkl+Y0Ot65fKWETroLoWZ4Z0UdYPZJX2RA==
X-Gm-Gg: AYBFou1cTuMUvWq3HuiTq/j3LD/qtO1rcafwTlS2FRrH5uo3yoEV5NzuvsXUZWWW8Ir
	oEghatw0jEt+kfQYdGTuWDYXHGOzi0tXPAt5tvJ92FHZ+0EZaqvXtQb3NfLpQ5Fy21//ASwgMwX
	7jQPCRDgOFHlGSYqJQSpvuEWtsM2lkyR0xWAg2KxQ78rgHwV3Xdu5d/L6rW/NJWAzZkaJ/40+sg
	51ILxBZcETbfvkMW48RNfZduPqyZYbHr2CHIt7SGJOLhrc1ks0sMMMLP7AVR2YOOi1mGPkmeyhI
	qPAoCQcd3H04QHg1MjPCvEDoJNdWFkvLxxe/M4pk//HAfFQWGcsHW6but0Ez
X-Received: by 2002:a17:90b:5348:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39dfe0471d3mr3083530a91.5.1789456634685;
        Tue, 15 Sep 2026 00:17:14 -0700 (PDT)
X-Received: by 2002:a17:90b:5348:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39dfe0471d3mr3083509a91.5.1789456634032;
        Tue, 15 Sep 2026 00:17:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:13 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:33 -0400
Subject: [PATCH v7 07/11] riscv: dts: sophgo: sg2044: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-7-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=28800;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=yq7S6R8PxPg8U1OJ/GAnLc0WhV4sKlaZgE74Pzvauug=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7Ym8pSGX1h2fWZZ61uFpk2nZa/tPLxU/CdH8Lunr
 oL/JCNCO0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiOZsYGZ6edQ96Xmp8WLuH
 4WlQ8L49B3V0hHSbOzfvn7P6yPSrW/cxMpwIc1StrS47YVsbeDclZtYkF6ZlrP8qN3t5ae7RDF2
 ygQkA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX/v14MJi2VOB1
 Z1krm05YjhwxgGnbntPSLO7IAGIPFTheguFvI7tAyBTILjCBuqAlgtfC4TjgolLVLEktjcS9xzg
 3FbUIE9nh3GMz95IDeR/a82Tz9HNVfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXywP+Ug3szOaM
 uwhk8fpAAMVgEryeg2uZ+qC4R0h3wjCdt113LyiQuQX2gxdx8zMC/cDCAwozBNaPvbGkNCpN1+b
 eiPxojOKbmgYRxMVUkpJKeNOnCHLFMHNl7HPlknAo43PwBsVPGjl2sdoLR1JXkvU6Qcj8OyUiyD
 6w/5d3jdmgXE+9tLtGz+HyJbXuhsQTvcFp7KjkCejMeWZF5q0YbScsgft3CBPraOmrrF21H+V1J
 TAow2JpuOspNfcunnDfBrtCn5nKYDe2Q82dC0yUbwvSOJfq4iX7UFcU6WYOgaNhsVdEvYPNd7kz
 7vkPwrcUU5yiiC4kbcO3wcdzyKFk6Znf/AzVlJikdEZD7n+x9fwOg61FZtJW2odlC7O4T2UJ5Cv
 siOdlLvQPmpy/IjHO8m58/JO5fZt+gkQvbXfHfEiSo56gbEe/Q75fwN9IoD1aK14fkSSEMj1QDP
 PaHzAl+dO1qjv6H6SXw==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8f0fb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=WzeAf3B23z0EryTBMFwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: b6VDkEgZEbwU3EojCYS6BF9jMAvEEBOw
X-Proofpoint-ORIG-GUID: b6VDkEgZEbwU3EojCYS6BF9jMAvEEBOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

The SG2044 cores have 64-byte cache blocks, described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b.  Declare it in
each core's riscv,isa-extensions.

Acked-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: No change.
v5: No change.
v4: Add Inochi Amaoto's Acked-by.
v3: New patch.
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 128 ++++++++++++++--------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index f66a382c95bd9..5943407020e32 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -31,7 +31,7 @@ cpu0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -67,7 +67,7 @@ cpu1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -103,7 +103,7 @@ cpu2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -139,7 +139,7 @@ cpu3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -175,7 +175,7 @@ cpu4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -211,7 +211,7 @@ cpu5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -247,7 +247,7 @@ cpu6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -283,7 +283,7 @@ cpu7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -319,7 +319,7 @@ cpu8: cpu@8 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -355,7 +355,7 @@ cpu9: cpu@9 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -391,7 +391,7 @@ cpu10: cpu@a {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -427,7 +427,7 @@ cpu11: cpu@b {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -463,7 +463,7 @@ cpu12: cpu@c {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -499,7 +499,7 @@ cpu13: cpu@d {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -535,7 +535,7 @@ cpu14: cpu@e {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -571,7 +571,7 @@ cpu15: cpu@f {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -607,7 +607,7 @@ cpu16: cpu@10 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -643,7 +643,7 @@ cpu17: cpu@11 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -679,7 +679,7 @@ cpu18: cpu@12 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -715,7 +715,7 @@ cpu19: cpu@13 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -751,7 +751,7 @@ cpu20: cpu@14 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -787,7 +787,7 @@ cpu21: cpu@15 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -823,7 +823,7 @@ cpu22: cpu@16 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -859,7 +859,7 @@ cpu23: cpu@17 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -895,7 +895,7 @@ cpu24: cpu@18 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -931,7 +931,7 @@ cpu25: cpu@19 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -967,7 +967,7 @@ cpu26: cpu@1a {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1003,7 +1003,7 @@ cpu27: cpu@1b {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1039,7 +1039,7 @@ cpu28: cpu@1c {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1075,7 +1075,7 @@ cpu29: cpu@1d {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1111,7 +1111,7 @@ cpu30: cpu@1e {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1147,7 +1147,7 @@ cpu31: cpu@1f {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1183,7 +1183,7 @@ cpu32: cpu@20 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1219,7 +1219,7 @@ cpu33: cpu@21 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1255,7 +1255,7 @@ cpu34: cpu@22 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1291,7 +1291,7 @@ cpu35: cpu@23 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1327,7 +1327,7 @@ cpu36: cpu@24 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1363,7 +1363,7 @@ cpu37: cpu@25 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1399,7 +1399,7 @@ cpu38: cpu@26 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1435,7 +1435,7 @@ cpu39: cpu@27 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1471,7 +1471,7 @@ cpu40: cpu@28 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1507,7 +1507,7 @@ cpu41: cpu@29 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1543,7 +1543,7 @@ cpu42: cpu@2a {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1579,7 +1579,7 @@ cpu43: cpu@2b {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1615,7 +1615,7 @@ cpu44: cpu@2c {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1651,7 +1651,7 @@ cpu45: cpu@2d {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1687,7 +1687,7 @@ cpu46: cpu@2e {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1723,7 +1723,7 @@ cpu47: cpu@2f {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1759,7 +1759,7 @@ cpu48: cpu@30 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1795,7 +1795,7 @@ cpu49: cpu@31 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1831,7 +1831,7 @@ cpu50: cpu@32 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1867,7 +1867,7 @@ cpu51: cpu@33 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1903,7 +1903,7 @@ cpu52: cpu@34 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1939,7 +1939,7 @@ cpu53: cpu@35 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1975,7 +1975,7 @@ cpu54: cpu@36 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2011,7 +2011,7 @@ cpu55: cpu@37 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2047,7 +2047,7 @@ cpu56: cpu@38 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2083,7 +2083,7 @@ cpu57: cpu@39 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2119,7 +2119,7 @@ cpu58: cpu@3a {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2155,7 +2155,7 @@ cpu59: cpu@3b {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2191,7 +2191,7 @@ cpu60: cpu@3c {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2227,7 +2227,7 @@ cpu61: cpu@3d {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2263,7 +2263,7 @@ cpu62: cpu@3e {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2299,7 +2299,7 @@ cpu63: cpu@3f {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",

-- 
2.43.0

