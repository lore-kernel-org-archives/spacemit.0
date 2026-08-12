Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC5432E95
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577747; cv=none; b=YIAO7o0PSnO1vDeDC15hZqbvgv0oMyL/0e5O9cNDzq2oCzXII+5fPqPdto6pWox4iGRLEoN0H6ZmejKMZiccEhBQP4trmzTda0nHK7elYTqqXGKfLSAac8VsGIpGFKbm4+oCQXugdnNPHCORL5john7fcSKxde0Bzmdoe0/8G44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577747; c=relaxed/simple;
	bh=QyqHI+sUeQVxWvQrOwtnT/gJ/FO4HgU8O5PI3aM/OFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGGT001wIsjwpTo4rlZDolPK6R8gzyIucrSj/FCDUU20i5gQ8SQoDT4RGTrF+qtQ/82UBYQ6UCnHDbnskWpqlsxP/DeyHo8D8wOKeDmSsUMXx+gvMe/f5xqsUYrgQO/EPjSyxmLo6XGZCszYVRrO46Z7zMy2vwBXrjGLfmP/F/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtWyFrRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APX4YEVf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtWyFrRl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APX4YEVf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLdeD266511
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVU2C1C9NanhLtmMCL5sOG0DpcSR7DnUoKXsNJXoRQc=; b=dtWyFrRltgy/udt4
	BgFEClHNVnLwxoeZdgXycV26uIfqYHXGXJvv3Y5vk9L3/tIc11gBi+xRjnuujU19
	VMeu8jc2IxHWbxm02ftKr7daqg6Mu5zz2tIeh7jSPkUPi2dFxBCJ4xg1MKX+KaU5
	ih2H+MCstNRe7DC1tL7pUmJv6/lnmB3dlGfD6/UIjLoRY1NmeqZMMNxvyLTQ0M5d
	q4bts11bhNXvJObIOthcWjuCAYp6gL36UhL9oKc39eRR+x2vKh9UUxzimrc57hm1
	XauLgpu6DmG+V7MVoI9S8q/x6EZYhp7D/FQ4qL4Iw5g6YsgkCT9jIfy5IJiDSD7Q
	442SJA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mndbvt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 23:35:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so22667725ad.3
        for <spacemit@lists.linux.dev>; Wed, 12 Aug 2026 16:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577742; x=1787182542; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVU2C1C9NanhLtmMCL5sOG0DpcSR7DnUoKXsNJXoRQc=;
        b=APX4YEVfIsiE4tmEkIPWGKCjRNABM0Qeu6hG489rcVc+boWv0n/ug8VvkiGG/qGl5x
         dIIOlKgdBPoUZXxwA+0zdbg9W+EFflwVSp47LH+r3PBT95QhJuSMbASTE+C/PvAipa8r
         jbf9KnJHzAJSWjouQTsOGGBMcLbm/Sgs2Oj2sE8PCGUom5ced4bYXOCJm9rTLg+wtvIY
         zOGnZcG8TxPeLzplqDhi8KPJdQ3EsSJyGEUXxkKDt50p5nMl4z6+AHmcuUfkGhICOl3L
         cku3WSTSQMc2F0cEcxPdzjvwxat4ChORnGEO/pCbllMQktEoK/7rILY3904q2NU6TZYo
         j1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577742; x=1787182542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVU2C1C9NanhLtmMCL5sOG0DpcSR7DnUoKXsNJXoRQc=;
        b=YiHyzey/Cemtx5WMV74UYNrrkLvTTKxjiz/0XpYfqg1fpeRailFduvVE8oFjw4E0H7
         pQakjg8Par0/UdZhQiY5k1/iidpPXXfdkpfyCdDPXHCKydqfgQZrnaITQFZa1dCamfik
         B8K8tp9m0C1IrnpnaKdRfv6AJiPIA6LcNLGHZmH/ea6eDaHaUttdBUUnNObrbMrBloPk
         WKpSO1UU1YuV9Q6nhURp2dhrOdLJy1OswKrl06nDg2aGWVrJlYWuwPf7ayLOaTlWTVJQ
         22qNKzUZ/hyZRJj4YiwkAnNiW2C/jp9s1Lqo0EHkb6cgqDbppSDgn2L9eB3EBNZmvJ9Z
         nmFA==
X-Forwarded-Encrypted: i=1; AHgh+RqBXaEw9iia5fUkKSrvNUISu2IXJd7kvwo5MzGa7zDiSS0J1t2X9dN7Qerglymds1VroXUd4f5hAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpcfhM3H6wJUatH5fvq9RRUfxv7Ii16TdMD7ytuCsPhzPefvbz
	3k7H3mIWOnu+2l+aFNXBH+r9Q/Ick5XaWlagGxXKHvx28CMxY7RWQlW9jY95zCXmgDMrXQsUE8e
	PQ/9CCBBJ/MUXGwtXxHKZJcpES/YIZCf8NUMY1CdYvhF/pxM3mlhtZEDJRj9EDA==
X-Gm-Gg: AR+sD12MQzgLHhlsZxH98DlLnZX8BgjLVbnXrH5F2wrOmh/5XecPnix/ewPrudobpLf
	w/Sp7JO3f1xgXxAC6XD75gVgDns9yLHC4mMbIKfxEQNVsF3R5JfmUjm3WPJfbxFM9+CoHT+SDgH
	1MEo6S/vCX5Gpq9+rSSCJUCJ49oZr5s18UvCzRASw1Pr5Rw3gsNSPoIrXMzhoaJcp+MTrDFKMfP
	cy0FKgMyPxlw/8IOyZ8SCdx9L0lBPVCxAFBjq8RU8ln4jdlufMHherwAMPDqYfdPHQHOioiE926
	1pZ9edFyhhpivNwmllxIqCIsWigs//DBvK2nVyZDvfnVjA6o4HReI8atJfoCNQ==
X-Received: by 2002:a17:902:f684:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2d37e8a5fe6mr17377565ad.18.1786577741867;
        Wed, 12 Aug 2026 16:35:41 -0700 (PDT)
X-Received: by 2002:a17:902:f684:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2d37e8a5fe6mr17376945ad.18.1786577741373;
        Wed, 12 Aug 2026 16:35:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:40 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:52 -0400
Subject: [PATCH v6 06/11] riscv: dts: spacemit: k1: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-6-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10127;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=QyqHI+sUeQVxWvQrOwtnT/gJ/FO4HgU8O5PI3aM/OFc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZlEu7/frhZ49//znWeycOFuntP0fk7lFIk6ZvT9sJ
 5qbudizo5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACbimcfwzzZeN9jlbaxx2Ce7
 ZXKlehnCS2bf6NE1C2hQ3mvHKCv5mpFhK3PO4s63xwJvTnCzv9X2RlTqSEpLxOugNUu4+jjWBTC
 zAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX8Fuj4hvKKSAB
 oV+lIiRd3Pc3i+X9RSVOlPC7z8DSQ7CapsKFEHK4kOiRGRmn82bFLqVRdXgXGaHta0rvlgMLWwx
 dTz85wQ+f6B3TXEtSN2r0FAjLCa0Qhw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX36oVUBFWnUg2
 n8dXhBrqlawI3wGEhs92iZNsTYWLhQQF+rNdmKlNsS97VO6a9lCmhKNKhoDst8X9Mvlzr2kMMfr
 QmwIqrZmIL+XC+eZYBtiUHJkKULoBd4cijewnwFmW9l+itGpjFKuAidk8fjJnMmfGC8RZfAcZVS
 y1bOrSVu7TxNAYdKYkXM6aLzynergWhOhU3MqTp+nNlrh7o7clCy0mY7/4ejT9r5kXEPWw5Yg94
 0GgwEZ4lwdBrY5xic1QrtHyHUdfeUiGR5+NJfdZC3fniGctU1PZlh9ImUVC2EBhoPN4HSGiNYcE
 uMNTYLbgWuj22y0hRlPlPxL60bDW4UXN6GfAeUwqZ/wM/XhWtkfQJRPYWJvVPk0BwlQlnaCnqCo
 Y9TiE5MKvDM17OXEt0E58c5MJaNdzcFaMR2O7AcmS3HYWnDdeXt/gEzEp8a0Osmg0xdRhYn8Au2
 rVYKhKjGjgdkqFOxwGA==
X-Proofpoint-GUID: OzWbde3u9rNj3JQCdyNr1HIMIAjUrJ5s
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7d034e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=rNVubqczMo3w_3ApqVoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: OzWbde3u9rNj3JQCdyNr1HIMIAjUrJ5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

The K1 X60 cores have 64-byte cache blocks, described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b.  Declare it in
each core's riscv,isa-extensions and in the deprecated riscv,isa string.

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: No change.
v5: No change.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 80 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011f..f179c619f580 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -54,12 +54,12 @@ cpu_0: cpu@0 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <0>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -84,12 +84,12 @@ cpu_1: cpu@1 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <1>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -114,12 +114,12 @@ cpu_2: cpu@2 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <2>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -144,12 +144,12 @@ cpu_3: cpu@3 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <3>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -174,12 +174,12 @@ cpu_4: cpu@4 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <4>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -204,12 +204,12 @@ cpu_5: cpu@5 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <5>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -234,12 +234,12 @@ cpu_6: cpu@6 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <6>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -264,12 +264,12 @@ cpu_7: cpu@7 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <7>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;

-- 
2.43.0

