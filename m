Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB564570E1
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456586; cv=none; b=casIrGcDQXyPM9mcLmdiY0cp8FRyo+/LF+D3ItrCHungTpyAVvlipI0zIM8m+0M8ltkaje9/LfOdRAiRLIW+Po+9k/lZSAgKjGVMFOeitfhkaU3kpNY+WYta1uzQ1EO/lk0r8tT4MKG24BDMmTljEZtye8f9da3IJ2gQffid5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456586; c=relaxed/simple;
	bh=tEUSuh+12+n2mOHsQyRq/XAx5BMUtepxX9gnkXe17gE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tgBLdPX2mt4fRBOvuYTHTyVg/9BGE5r5xGy+MHcvPF+V4mprlE2FNv0/JDopyQ0sZ5cvpxf08zpZdeqVz5b3HZSvsFHbFOzqI/Hv180V+TSeyrqxldXR7+zfvBpEH7Z3XxD//32PQrbE8d0XjA4BPz34/N0JDcNJgXz/HGA7BTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GW79/Iky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O93d5Otk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GW79/Iky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O93d5Otk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZPwC3487175
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6vg1mO1SMayNXivSbg4Hvm
	4BxvI6y2mrrEbszrDQ0Ng=; b=GW79/Iky5bs6zg6m+dYsaxuXcY2ZexGmKWAauJ
	1M6x/tUKSAt8GoItds5Lc0DudMPbn94yGzN2Y42YTfeIpLsJBmyLBDIFKITfFkEX
	IhDsKGMPOFBmAjHFBsrf/ceqrxkYLDGOlwqB1wuebvJBdRieGeknP/wg+wBmvn5+
	WETGsiHxNTgrunw2ew7qViEF8Z6KFGGD/ZGjQXrGwXdYHiq7PSViw/ZYXfzVhTiU
	j4GLHC7vMtcQzApf6udgCNoRZXALZuVg1l1roY1ZaqTeHvIW389AoYodkyifOs20
	1cmLViXIlrQbq5ElMvL2WcjrKeMBpORCNWgC1Nj5rsRK4ckA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jer83u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so6945023a91.1
        for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456578; x=1790061378; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6vg1mO1SMayNXivSbg4Hvm4BxvI6y2mrrEbszrDQ0Ng=;
        b=O93d5OtkQDoXIB4NGejxQPh6CSyZp3Wa8mAZxSm/dEd57TXLdbQ4ppCFrrTKnDzfL+
         LlSzbGb1WYTpMGX66HfinBZm6fkozkrtoC4pEu+Lf92YQdy93Crgrp2tH2cF98s6Ko9p
         OsH8CsKgCg13TTt2fPW5KGlWlgjq4aQKGoKHT37z835Qwx7LRvJ6HZB10bPgh0Hj8eeq
         QAyZsdcOyVs4bJzrXLjBsYlxvydFHPskjvy3UHxC+vzxL10Dw7JT4weSODt92T6ai2H/
         zehpBNhjKLga+AZbCgpqzmXan3Cdldy5xxyBLObaA6Lj6O+JVkoJ9Zoq6FzqBI/H72ra
         bN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456578; x=1790061378;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6vg1mO1SMayNXivSbg4Hvm4BxvI6y2mrrEbszrDQ0Ng=;
        b=I+D0cVs5JKeLvKlZ5YdiHuBS69+eg6HpemrEB0LEiUUdrasIHKUcL6bhQU2x4kr4BO
         HUZTS0UsF3Yy956Ye0nx7MMAZjRsv40/Q5QkWNUY/XpsM94AUcQxDuVNBW56Ug+b0CcS
         ZxHT6B4T74NtT9IcxpGH/pGWd5ABjpR9V2iYZIArTkWLpZMLH6ni6gPsGnvZCrhyVj9X
         rxV7e2+D5o/wFXheCTn/owoxzAOvTYm2xA5EFzwURBnuA9PwmSPDztp9VydPRoI6Apb7
         qTe3/S0kgxR6WwqyDKFLeWhwYEDilJXv9FHxkhAN+riM0WkWmrxV5WO0LL5C4omNfTIQ
         3lbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHqJ7oHD4z1ZKTe78PUl0KgbWZ+C+NQg5wwYHbnGlV/7kPaTY3hB64zBHhTX24n9Jd+v4oUSRsNg==@lists.linux.dev
X-Gm-Message-State: AFuF++nNpXgZ5pDGvYtsgJK1bO2Q5tLlnMhpcrO0kWux519QOHA8KqYJ
	QD0gOmatcS4YY+HXyBaWg+mw8Rhsh2r99y9dFEXfiBYWsczJqAzJf3Vuq/fc2oS9AfJqmAbkz1O
	MoPdff/2b8g3JhzTkfuPODbMjTzUqRQSm+XBg3nl3LM9yJ7xVmJiIneZdSaSW/w==
X-Gm-Gg: AYBFou38sx0DMpqCE5UHp0KmPJnlJZarVZ+EBoEkMvqqCdUbNhOQgno/x8G1HNWx6Kg
	yyIKJcZdz7ifXunIEO1rGqMk+Nk4iPvSgDZrQABD+8/7OWV0pEvZBY502O3kgRWzFoJnUC5O1dA
	Wi5f7sbXwBuP26f8M3gcICjvGyC0W61Z92k8uArl6TcdyK/7CLkSkYekOp0YOTHu5CeimtJDGDF
	C6w9afT8Zn5JXFbnvU9a+p7oLviiH1FVrWqRMpZWaNZd5bWdBe1xWX9YvkV8NKLVWllLehLbP/E
	h0YU0k5ZAxcKKwZxqSsFsI5fN17DRiv8Nhn9DUzIcAJTYf4M1mbkGtrC1EuD
X-Received: by 2002:a17:90b:1b08:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39dfebe7695mr5401662a91.22.1789456577616;
        Tue, 15 Sep 2026 00:16:17 -0700 (PDT)
X-Received: by 2002:a17:90b:1b08:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39dfebe7695mr5401594a91.22.1789456577041;
        Tue, 15 Sep 2026 00:16:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:16 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v7 00/11] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Tue, 15 Sep 2026 03:15:26 -0400
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7wqGoC/3XPTW7DIBAF4KtErEsEw4+hK9+j6mLAOKZK4hRst
 1XkuxcnlVxFjjSbJw3fG64khxRDJq+7K0lhijn25xKqlx3xHZ4PgcamZAIMNFPM0DQhiFFL2n1
 dUu8CnYDyBlglrHfOBFJeXlJo4/dNfXu/5zy6j+CHhVo2upiHPv3caidY9v4aON9sKMMocK9QS
 dnyxtcpZp8HTHvfn8hSMomV0UxsM6IwSoHFyoERRtaHE8bjash/xrNTZDFEyziClFYa82io1aj
 YE0Mt3/Gat1aitgofDb0ahsO2oYvhrVHYClDambrPef854rEopzs1z/MvoOEsdOIBAAA=
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
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
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8254;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=tEUSuh+12+n2mOHsQyRq/XAx5BMUtepxX9gnkXe17gE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH9bmc60PXu7G/GAZ8/+3u2pqOE/VqK6bKcU+f0e0n
 2+IoOb1jlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiIxk1Ghj6hjAfvM5/f1y6d
 ljE/MMt0p6KjTd5z6WN31E7JCbGkqQNV7GY6ZVO7f823C0I5y26eSTnxiNWIP+7wrv5rzToPXdy
 YAQ==
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX+e39I2fG6FgA
 vZrTOp/OrJ6nqaDqxts9gnDFeOCTrm36zLKqCw7Mde0jVXkcyGcCB6mU1eoofvqar2sBxRMPrN7
 OPtHCjlFtSesyLQLrSZjw07A2tKwZhM=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa8f0c3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=ee_2aqc6AAAA:8 a=d1g4yi8szQta50catT4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: j3b9SKSu-p2iK2vMOObb11NVxTVRxZQl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXyT4k6QMyN+VD
 +PLLo2qS9WriuVz5Bafzz/XTuarIxrKy/JpXv5g3XyYkmegVQIE4zR9p5NaFgI9XjeFDefEA0c9
 xgUPHTxgZoqboOxpekWrBZLCWFuCKfO2kJkyCiae0hO/SbyfPvNlkCMyDRpznmbx5tTxM78VSMG
 sfuU+Vvatd/rhchka0zR2kpne3oWN/vaQ9ZlaJazDkurKKGwoDkESaa2Nr70oiUJfPrvdhgHqK5
 96Kwy61RIRAkoMxQbHuq/6hGeqYLw+CYyq04ivkDgRXJEt7+VK9gPZh9/UL1eFw/PxVpT79AgzW
 neWqotZjJ6CupXmBS2MG6ZGwpBXxlu/3Q8JBjvY+LJRdiUST3+v3RlxUtnbpBKmoSe4/zPXUkh2
 NPwyaGHu4PyNnBTeUUoPcucib6af8t3YefZwQeylFJnBfTd4YZXhBBakxUCDY4R90w/+5hrIM/5
 iv1CDSV3/b3GK3nYk3Q==
X-Proofpoint-ORIG-GUID: j3b9SKSu-p2iK2vMOObb11NVxTVRxZQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150102

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases (IMA
and RVA23U64) from the kernel's ISA extension bitmap at init time, and
surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
can add RVA23S64, and backward RVA22 / RVA20 detection, to
riscv_set_isa_bases() without changes to the surrounding code.

v7 fixes a v6 bug found while testing against glibc: the vDSO copy of
RISCV_HWPROBE_KEY_BASE_BEHAVIOR was 0, see [3].

Series outline (v7):

  Per-extension cpufeature parsing + hwprobe export:
   1.  B (the Zba/Zbb/Zbs set).

  Zic64b (new first-class extension):
   2.  dt-bindings: require a cbom/cbop/cboz block-size property whenever
       the matching Zicbom/Zicbop/Zicboz is present.
   3.  Zic64b dt-binding, with a schema check.
   4.  Zic64b cpufeature parsing + hwprobe export.
   5-7. dts: declare zic64b in the SpacemiT K3, SpacemiT K1, and Sophgo
        SG2044 device trees.

  RVA23U64 base detection and exposure:
   8.  riscv_have_user_pmlen(): accessor for user pointer-masking PMLEN
       support.
   9.  cpufeature: per-hart and host-wide isa_bases bitmaps; IMA and
       RVA23U64 detection lives here.
  10.  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       rva23u64.
  11.  hwprobe: expose RVA23U64.

A follow-up series exposing these extensions to KVM guests (extending
the KVM ISA extension ONE_REG interface) will be prepared on top of
this one and will be posted separately.

Cc'ing the hwprobe, glibc and Debian side (Andy, Florian, Peter, Zihong,
Mark, Aurelien): the RVA23U64 base behavior bit is what a glibc-hwcaps
"rva23u64" subdirectory would key on. Comments welcome.

Tested on QEMU with '-cpu rva23s64,sv39=on':
1) /proc/cpuinfo reports
     "isa bases : rv64ima rva23u64"
   on both the aggregated and per-hart lines.
2) hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
     BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64
   through both the vDSO and the raw syscall (v6 returned 0 through the
   vDSO, see [3]).
3) With '-cpu rva22s64', /proc/cpuinfo reports "isa bases : rv64ima"
   and both hwprobe paths return BASE_BEHAVIOR_IMA only, as expected.

A branch is available for all patches in the series: [2].

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v7/ [2]
Link: https://lore.kernel.org/all/c24e720e279fed0296f1f78630b6a471.guodong.xu@oss.qualcomm.com/ [3]

Changes in v7:
- Patch 09: register riscv_init_isa_bases() at arch_initcall so the vDSO
  hwprobe snapshot (arch_initcall_sync) sees the ISA bases; v6 returned 0
  for RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO, IMA bit included,
  while the syscall path was correct [3].
- Patch 09: keep riscv_isa_bases static and add riscv_isa_base_available(),
  mirroring the extension accessor; patches 10 and 11 use it.
- Collected Acked-by from Conor Dooley on patches 02 and 03.
- Rebased onto riscv/for-next at 77ae27fd98f3 (post 7.3 merge window);
  no code adaptation needed.
- Link to v6: https://patch.msgid.link/20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com

Changes in v6:
- Rebased onto riscv/for-next; dropped patches 1-6 of v5, which have been
  applied by Paul.
- dt-bindings block-size: only match nodes that have
  riscv,isa-extensions (fix suggested by Conor, breakage reported by
  Rob's bot).
- Zic64b dt-binding: guard the zic64b rule the same way (same defect
  class, found while fixing the above).
- Follow the _BITULL() style of commit 8da45c93dfa9 ("RISC-V: hwprobe:
  Use BIT macro to avoid warnings") for the new hwprobe bits (EXT_B,
  EXT_ZIC64B, BASE_BEHAVIOR_RVA23U64).
- Zic64b: RISCV_ISA_EXT_ZIC64B renumbered 110 to 116 after upstream
  additions took 106-111.
- Link to v5: https://patch.msgid.link/20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com

Changes in v5:
- Rebased onto v7.2-rc1.
- New patch: make riscv,cbom/cbop/cboz-block-size required whenever the
  matching Zicbom/Zicbop/Zicboz extension is present (Conor).
- Ziccamoa/Za64rs: drop the Zaamo/Zalrsc validate callbacks (Conor).
- Zic64b dt-binding: fix a double space in the commit message (Conor).
- Collected Reviewed-by and Acked-by tags in v4.
- Link to v4: https://patch.msgid.link/20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com

Changes in v4:
- New patch: sort the multi-letter Z extensions alphanumerically in the
  dt-binding (Conor), and place zic64b at its sorted position.
- Zic64b cpufeature: validate only the CBO block sizes that are present;
  overlaps Qingwei Hu's earlier patch, so it is now authored by Qingwei.
- Document EXT_ZICFISS / EXT_ZICFILP: cite the riscv-cfi v1.0 tag commit.
- Picked up Inochi Amaoto's Acked-by (SG2044 dts) and Andrew Jones's
  Reviewed-by (documentation patch).
- Link to v3: https://patch.msgid.link/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com

Changes in v3:
- Add Zic64b as a first-class ISA extension: dt-binding, cpufeature
  parsing with a validate check, hwprobe export, and device-tree
  declarations for K3/K1/SG2044.
- Patch 1 is now a clean up of hwprobe.rst indentation.
- Document RISCV_HWPROBE_EXT_ZICFILP alongside ZICFISS.
- Move the Zicclsm hwprobe.rst entry to the IMA_EXT_1 section to match
  its bit allocation.
- Collect Anup Patel's Acked-by/Reviewed-by on Patch 3, the capitalization.
- In cpufeature.c, set the local ext_mask with __set_bit().
- Update Guodong Xu's email to docular.xu@gmail.com.
- Link to v2: https://patch.msgid.link/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com

Changes in v2 (since Andrew's RFC v1):
- Rebased onto v7.1-rc2.
- Reworked rva23u64 detection into per-hart and host isa_bases bitmaps,
  shared by /proc/cpuinfo and hwprobe.
- Scoped to IMA and RVA23U64 (RVA23S64, RVA20/RVA22 cpuinfo output deferred).
- Link to v1:  https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
Andrew Jones (2):
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Guodong Xu (8):
      dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
      dt-bindings: riscv: Add Zic64b extension description
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Qingwei Hu (1):
      riscv: Add Zic64b to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               |  16 +++
 .../devicetree/bindings/riscv/extensions.yaml      |  54 ++++++++
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 128 +++++++++----------
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  80 ++++++------
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  48 +++----
 arch/riscv/include/asm/cpufeature.h                |  13 ++
 arch/riscv/include/asm/hwcap.h                     |   2 +
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   5 +-
 arch/riscv/kernel/cpu.c                            |  26 ++++
 arch/riscv/kernel/cpufeature.c                     | 140 +++++++++++++++++++++
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  25 ++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 15 files changed, 419 insertions(+), 137 deletions(-)
---
base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>

