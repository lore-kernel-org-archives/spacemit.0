Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C83D9541
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888751; cv=none; b=Y/QlUHIu6gviAWtFUvF53MIpCHZytt4WeCONU4Td1zCRMhAOKVyLU1WjFL4wTJsj2QzBMesenFix7uuAwJ15gYlkjxuC/lTAjN/cHBxUoCQBvzCplyZIUe43JFuMNm6V5O7BCUwbi93rS/LLKDACvEq0wagd9ssFDAupgLMxfu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888751; c=relaxed/simple;
	bh=YtizxNhzSjBCt9sQnYHFkLSFuB+kE8v57Hh6K2S5Rxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGwCumgX3Nf9v94hTqJ7kWeYIhxmhU3XKm0qa4UbnSjXNv4vfARD4AJFjy5+KSXlkLHeRBAp0xn4r8C3IZ0ODT5Ufk4oyLJQO1ikVnec8tn/bDIvGUQCmp3ZLNZaCyehef3kFsOc2+Ik4fcHMyY73c0hfFyB4SFbWpnI+8KdFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsswISVR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxWyR22U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsswISVR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxWyR22U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K6B8Fw2076510
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=; b=NsswISVRApcxNnWd
	q9I7ebIEijYBgNSzK53NvxYK6vfDmnBchXTGFnd87W43g4i/ZCnmvh8ERfITtzrC
	Q4yrhbhZvaz2cc+4afmKS3BoDvSsKa4X0n13/qMnrPluqkmcP/5V9QXQadq/AJIr
	/MukywDiwsY7CYzgQN8fReDdaE+PFwMkYDsZZlpShm1LQpJHhNs8XWVDZFZ8LIrn
	G/eMZJYlavH2jybYjYA5rSMgWF24ZBpEVDnm+FlLaJ2zRx7bI1lFmbkMw26zzhEV
	8aqB+7otClsf3bOiAkhIIqRAeH1JR/QBiD1weknie4Ekou1ovUtNuF55PHwuUDdx
	7CBebQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd62kdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:19:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1840973a12.2
        for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888747; x=1790493547; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=;
        b=dxWyR22Um80+LMYPoWVlZKe0a3MNBCDJ5E//ZSgqGwcYVboAe2KYfhr2f9lMxYiGrf
         sCPjhuHMcgRq5K3Sxm6Sod5refdtcuob0c7jhocHgGWpg6IzLZm1AoeDRBKQREQlOvL+
         Y0XwjGP3qaM5J9k4Vk7g1neQ8HQK9SbrPmiMqvSeR7ySqR0akYf5D+HKssEwHxswRr9U
         q/o47s7BQS2mJu+UetJHozFMERhMefvSQWZP4HGm1o3iIlnpRmWpn6I9ldJh9YdFU8Kd
         WBFEshUqHTcLpSxLJmA8DA6lW1x1Vc8XUaTmZ1pHysblbuamoGn7BIpOPsZSC7RfbBcY
         FtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888747; x=1790493547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=;
        b=2eJDNL4eSSuCK87IysMpBDXv8gM5SlDY59ZDPKj2LxCaoKKxOQM9IS3vadYt6QkC10
         +nK6FcqIvQz3SjcTkyn4rM+3bu4AJxgRalATY0q3ywHwOkbYSIW52OvuiNh42XEQWXi0
         nhKpl173Gme/NA/VgOgAbNikYG8Fp5c8E4igWAca4KEsAsrZztgtLbmRnmVrdyVW88zB
         AgYbzGamK/0D8lW56dvUdTKcgvzYh/YPpBckV3x5NgVNwm8xZer5/qJaiOO4FMSAAbdo
         kvXvtDhKVCrlrvkQePBI+aO2sXgSwYEorHDzHhZRDuF8BHT5LDqCrt3JPlKzT5sfGM/b
         DK0Q==
X-Forwarded-Encrypted: i=1; AKwUvByoakKE4iVqFF3ui5odtes3eShlHZi+sqOhIVNZR595LrxymuU+sQXKM/x6XKdwK6rq5oDAZAL0Eg==@lists.linux.dev
X-Gm-Message-State: AFuF++laUMuKhuxm6t6Hl0csuVAXJd1Jr+b9kS82T3Lrm7W0SgroFsqh
	D3BZUS06JU4I1lGgrXlWkavWfBMslSua2I4JiMZA++j0ImSe1PpAqlCVM6Bn/+iCBX3nMauJj2q
	9vsCXapbM8Y39S4Suv9h9Mw8kLDyuDHmoe2vBNsB68YLG/5vTzu0gmQZHjwKy0Q==
X-Gm-Gg: AYBFou17WWwbN0nOGEdzT8oLMkBnGd0uGk3Dr+OSD6ztUSO3lBWVk/bQ1Dgw4UsefQF
	tXp+rjygwbvvA3MBtN2wcv7QoWaDmfCrGDUWdFFk+BQV6X7NLk/leNGzXYEjviotrKfPZf6+WYR
	DStKgIXrIGJgn55KCudvdfJrTUim/DuPSBgdhK93Z13yZUJeBZiWQHV5S/f5HSHpN7BloPNEFwA
	UbJ6a4H6RG2pcD8Px/KCyqarv/oO07OuLb172XZEzQMhucXwHyjyNnJv3cN7PS4V91ofY74MxxV
	aSPSXeVd8TBCYksVt9xvfoFvXRh0AoukyYEsgbZbDkv9NRhbafWoYZxXCZA=
X-Received: by 2002:a17:902:db0f:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2ddb52debe3mr111653595ad.19.1789888747496;
        Sun, 20 Sep 2026 00:19:07 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2ddb52debe3mr111653405ad.19.1789888747065;
        Sun, 20 Sep 2026 00:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:06 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:23 -0400
Subject: [PATCH v8 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-3-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2839;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=YtizxNhzSjBCt9sQnYHFkLSFuB+kE8v57Hh6K2S5Rxg=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSeumV0wYZYK+vLtRbLJ6lylrDY+nTvdCdoiixkD1
 2Stu8fdUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABN51srIMCsoe/lpzy/vhKV/
 S/9pkJ3Hkm6TZL9H7rLShfSXAZXnHRkZpk2ZoRiwsild9cBTqV0XDt58dW+J2Rrfme+LpTJ+MRx
 M5QIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX7YiyWxlxsXzI
 tQCjKVfeiL2IS1roDb0sy8GbbH/z1C03Ma9nP1PfWUZhXhmOO86iAxMKWQbyYnmlxvieRKVl1JL
 dR7c8arVVWXp7+bZJnOeKhO1EXR+4ifgJ/IgGCsx4kRvyNPsdRnOVv5wW6fx0RYM7wzlrZoR1fB
 xLfe/a6WN/R15FI0UgQXJdObfAxI0niHXk/gP8h0DSmaZCOYu9df4SC+6ldD08AZCNnF/LDyIwU
 ptECZY9J8v9N8Y41JX7F36fqc6T0dGkAtlMCaDrG0TylKhwD9SMKD0EvgoPVkNRJ9kLA1uwnijt
 dgnVXxfID3qBrb5ILcpCmauFuXSfh4gnJf9DrbTSp4XT/VcuSZKtKlBT4Z8olkxth4fYesJMS0h
 T8toRdi8uZoN0zfW19JwWfvSKu6Ft7IcTcqdVL3oz/f96H+X+VroNLmEgC3zVCBK9r/OxlOYmMW
 bcG55i/KsUUt64BIoig==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aaf88ec cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: dySiJGka6PVXr8-ArLbqvLSiEgChsvz8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX57NRPgsUwuE/
 LJ268HN3R2T2vEoe6NN7tDaa15D7zlDYHNs+8YqJB6rhgNIsXVjVYWfh5p1DcrasHJ0LjzmgGgm
 chmAYYZ2gy0od259dVGCqiotgE2iTVk=
X-Proofpoint-GUID: dySiJGka6PVXr8-ArLbqvLSiEgChsvz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64. The check
matches only nodes that use riscv,isa-extensions, so nodes carrying
just the deprecated riscv,isa string are not affected.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: Collected Acked-by from Conor Dooley.
v6: Guard the zic64b rule with required: riscv,isa-extensions so it
    cannot match nodes using only the deprecated riscv,isa string
    (same defect class as Rob's bot reported against the Zicbo*
    block-size patch).
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d4cde2a7b8b2..79491ef8f86a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -537,6 +537,12 @@   riscv,isa-extensions:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1211,6 +1217,22 @@   - if:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+      required:
+        - riscv,isa-extensions
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0

