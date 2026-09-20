Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343CE3D952E
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888743; cv=none; b=DOt6H0kS/eRrSDegBnJ5Wdl/cEpXxQTwUbY/9iaadCn3tI23LlXRzf5wh4TpLRNFQ0Ex4MFMkCbwk5zfHEWwc0pbMEfDMz/V9Q0B9z01dQRnecLPOCzCWdYK/fDzZRJiKN+civ8Cw7rzGLNBIXt7e8l5BZcRA1yE8Ai13sV2dJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888743; c=relaxed/simple;
	bh=QljQsLZgvTlldSo9Rcar9zMqwa1TqgtCUjw6CR+xk/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1ziVwnK/c4PJ+pp3Gq5gqXGinlEwhiA0GCwM2IO5i0YitF4a8FN4zvw7N62PdWx/kl4GYzVLBUysYNu5W/Gn63bo8T2fdXTegK4JtqQikaETQ/T8yz/mYJ64brqbTqzfajKgQW98KCkREjkeKRZCMnWFRBWKcx26Fgkauw+Lzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hv6f59Nm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxZhDli8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hv6f59Nm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxZhDli8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55XPN1477021
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	He+kIGk1e0kiBGfrpPN37cGZ/osNcIf8RyZ3rf3zVnI=; b=hv6f59NmZw3jCZxF
	7yeN1OYfWZz+4AZc46Bs+mwr7bAs0V3uJrUbKKwuQuzZpn5DLUsM5EaDuSGZnV0h
	D0qWLj73SFVEq0DNWnjXXVed0iDGmvnVIHGmJyG7RHmRTNp1lhzfNvIDqx4rDjCy
	oTbTPNBF2etK4FqaFwWzjmTDfimh8RoNQ6q1+7kPaThDhK0jMQsyBSnehXGp9YwN
	ZYMGpv9KaUIlhfYZJniiXEXzuif6nRKiC+gqTPNvOljKfSN0z7Z8fwJk/BcMrMr4
	TWsHgUHON6s3K9cQHXVKP/gB7Q2CM0HAoE8GpF0ITp20xFGXfL0+BQTA4XkYzaF7
	n4aXfg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrntu70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 07:19:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso40097375ad.1
        for <spacemit@lists.linux.dev>; Sun, 20 Sep 2026 00:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888740; x=1790493540; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=He+kIGk1e0kiBGfrpPN37cGZ/osNcIf8RyZ3rf3zVnI=;
        b=RxZhDli8kZBVBq6AS3j3DgF24G0+HZpNw1hO30J9n666Fpxr+u1M8oMhEIHY1zWC/y
         pQdkHYRN2caq0alZYj/ZAJ6ZWY1FzeguYa75GBWIghf3rlpZYMf9eJX/EJA+lawbD6FN
         kzC3piZ1hVeCOvHRVG+N2OIKMaOivErxPse2Tnt1+7QK0wezIwt38l6owWWjb310Dawj
         78ZSUW5kB5arpFv/o7V0AuKW/E6ObzJ+RfJbdKTwbCFSHpp2974PvzwdCsSMZutFJtYQ
         VQWravfLyGtBvP8OJFWDnxpqputYgifLLQLN9Aw6JbJSoqtKDdWUfi4o6npmfnITOmwi
         D3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888740; x=1790493540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He+kIGk1e0kiBGfrpPN37cGZ/osNcIf8RyZ3rf3zVnI=;
        b=vktscek6jsILagpAKqR2pITecftN4B9b8z2dKCDsWqH+AjnVh53V8FsQtMrKnV+iYT
         6vh8vYAIppScYXndxDvv5CdOgjUV7lwfChpQI7KNgiQkwL2XNdT6u8n4MgUaQUsACUqc
         oVKIw9IDqE+/78Sqvwc8JIt5PSmiizLysgYaz2NEyoQG1c4xnPRgByMHT9fWOvlccnK1
         HBEz2AZMjF3R9IyZ2uPLnpL/BIGuStaminbFqGrdxv+u1ctdBXgV5jePKI9a/Z05IVk4
         eEluRHJMRWLeND5uqNuvPtGbH/LibDZ6eu7zwa879bvh5dAjUKkiZklM6mgg/qRTM6n/
         5GIw==
X-Forwarded-Encrypted: i=1; AKwUvByi8l9fa3ghIObgFCjxbZo5YirAvtICv9jhI+twRTey9J+lpiyXWfDVSg9ZVSzfGsD/YYVMaiTx5w==@lists.linux.dev
X-Gm-Message-State: AFuF++mYuyGhPEUdC3g6TgV3th2hSQI4KLlU7+VHFjMZbKydZEpPGp6D
	PrlOAm99+6vxVMgVHXVsp9KqqCxr/iCgN/4Nk9ONj3vCO/3l0i0voyPgFdByDhZIN+i+Ij8cwlS
	+hmkUKix3sfEufmLWLq82yCGdFc1ppnld/vRojHmEy1Haedko8G7pFQPG+QkPtA==
X-Gm-Gg: AYBFou2f0oQZLWw69lmEDmqeShQgHchDW6urMmxzn2iaqD/QKLMgEko8uqfivHiOabp
	t4xUOm9z1bJjThn26fJJX8LJybd0oKaxPb/NfjgLxmnuXU5M7+Y7BPLdMbWRtdNm5F6rGZHzJ+0
	kjAxQ7dZN+xI3KhSZeUvGkLSQB4/65TK6Tt13OP57mj3VBGVhShy8dI4Z2zTZDtZIEyd+KYewN8
	gWnXHarKQMbLUrONN66sY9NA8ZjSVe7ozAo66rkog83V+ZSpbxmFHcKoBRFDdkIxJ948AX6HIkJ
	X39iDgDvgbiWmvD3bgYd4HXplDizgiD7gAfBZ+6eAeBk4le/jasTStdIayU=
X-Received: by 2002:a17:902:d487:b0:2db:8019:847a with SMTP id d9443c01a7336-2ddb1adbe4bmr125951135ad.9.1789888739938;
        Sun, 20 Sep 2026 00:18:59 -0700 (PDT)
X-Received: by 2002:a17:902:d487:b0:2db:8019:847a with SMTP id d9443c01a7336-2ddb1adbe4bmr125950945ad.9.1789888739468;
        Sun, 20 Sep 2026 00:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:18:58 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:22 -0400
Subject: [PATCH v8 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-2-5f14bc5c23d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=QljQsLZgvTlldSo9Rcar9zMqwa1TqgtCUjw6CR+xk/Y=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSfsnswMllI0v9+6LmXlWvmE6DXM+inXd0k0MCvNV
 /jhl8/aUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABPReMzIMOOz1DO9x7kN/NF2
 gf2asv43/SKsF1qfm316kYiek9acRkaGx9b/f31YXLve7MaGwClsGi0nNTa59s59tUhd6+7XTRH
 lPAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaf88e5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=JwNH_LCS6ezfG0-7a8gA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX++a7c0PO047n
 41fekBaBi5umYR452iX1uqpDavxBF1l/sj8G8GufUOuLhpuWzJJqKNHgVO8W1U5eNSfJ6V9Enkg
 HYauOWALX0Md7WekwtEtzMERKjaZpkU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX0Pkilg76kBfb
 NNyQtORaIZN2xEztegRW58OqtmKDGJ9BN+kIGvd/axPxeYeo1CH10aKIRgWMoEo9Q9paDhRFbKO
 k/J4Vp+aEKUDtIsc+fWEh45DmQ2X8bWPPJODuhQOx7FTOUbXPIZF6vQ/dGxu1ff/MpuprN8YKrF
 dSOvKXwFllJzkzjn6inQoL6GTtpnqE0rgk6eX2WUzp0WDP9doGQ+vc1K14bE6JExoxskTH3q4a4
 LO7WJY/H1D7p7EBatNsv4MPLXUjQh1fHLGOTilYsHuDTMZgQSj5bBiz8MifhnAiJs3OLQcb3sXD
 IfikDZhsiD2vFieLLQEOPQq3tYPZSlZ/mEMyTWGl2JwPgRP+FYByb7ieWVAsxmAJae6foyN0GVR
 NR9uhw72Elr7OT/Rqd8XYjAoXrRpIZsw2J6HGSFmuAQpY+lcWzmuHkxIwYPGkikjElT7Y+xWv1C
 F6N0FtQRUIbdnKWJRBQ==
X-Proofpoint-ORIG-GUID: DfnFvTco26IBLUqmOO0diWrox5Hon1GI
X-Proofpoint-GUID: DfnFvTco26IBLUqmOO0diWrox5Hon1GI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Match only nodes that use riscv,isa-extensions, so nodes carrying just
the deprecated riscv,isa string are not affected.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: Collected Acked-by from Conor Dooley.
v6: Only match nodes that have riscv,isa-extensions, fixing
    dt_binding_check errors on legacy riscv,isa-only nodes (fix
    suggested by Conor, breakage reported by Rob's bot).
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 577d7ae5576b..d4cde2a7b8b2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1211,6 +1211,38 @@   - if:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0

