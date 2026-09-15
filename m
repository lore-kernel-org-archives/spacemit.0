Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62879415B7B
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456608; cv=none; b=buPyF2WquWfuPAYqVo0wJF37bzO+DeaCZDdZZJTU8Pd+4bUnYAn6b+z9gmdxxYnGoPsjcEuvNGge1XLjRo17kpJHWdl/c2fmOQmhAUAIEuT6vQloKWG/FKFTE65VKtSn+el6cAJPJ0gpsIYgurC5gzMndOnZFxWyny9B+OpCnAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456608; c=relaxed/simple;
	bh=ly0eko061Qlf/uDE0HQLjreuewjv2PPwW/vrF9/DA5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCsoha5yWHFFTSUlrqP2QJCjMm7Y/oNwX3Nezh9+45Uo9ASs66amBSkCvgQDVtZvELMicn5RXOu3DwqbCTPd7U4UwWMRIXKQTozo5gr54DfsZ/v+G9lB4q55DYhqiVFHoDgxMeD+Ht3ezd8XsRUUXQP8zPD5VthBTxmpwc9Xq4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JG0KXhnR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFbImo2+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JG0KXhnR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFbImo2+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Ysgf4048586
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=; b=JG0KXhnRe0WnZHAP
	iUwfZ62ONv6ZsdeAK6dTLq1BJcen0HiH6g3V1hiQ9+VnZNF13voELp9kDi+kXwCo
	SUdeDsE6FA+vxtStPRfFq6nRNdHCo9Xd34/Z5yALRpmTjlNwNSSAFTiOixo1iu2K
	mL8zZXy8vIPJ223PNqJpEZhDQyIb/n1aPh6qWUyMNa9wxpKBPf5taHKAa5nraqB8
	jkBUqlL0xzY0FibgASXsziXaHfkUV+aZczhzYtCfP3hYHXJCjyvJbpi/q1AyEuRQ
	whQ/sMJ2ROYjmH+irENNvIV59lQMzu+weiiE8tfi4TYAukhlnw3uhChigZe37Bon
	Eaukqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea0hap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso7707669a91.2
        for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456602; x=1790061402; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=;
        b=SFbImo2+BfKp0SRX6oY2l0v0fd8dW1rgfQk97mhNAtuLq2wH14xsY6r1lWrg2IO30k
         ngtN1B0pWg3JMorZUZRgHnuCShjvXPap0uSIebfjZm0AppGBUCzSqj4jHbSzUtJs7mtf
         jUCj6SqOPmXVd0g3AXfasAZa6RK/oi6zAGPhTcWz9CCti/wpbV9Dg6PS7CvJ9RY3zVV5
         luqAKfS5WtGiAH5MOAn/AV3ehdp/oMcX+uLnJ52ztsr9jcwG8YlqO9fcDjTH/ARTe9xh
         iN5iN/N/vpd1rL4BdmA+fIX6a07Y9KCqOBbofZ+7Af/ji/7uAAf/giUZD60hGdxEykna
         UmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456602; x=1790061402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=;
        b=ed/xxjhgU1I5TiOOzhdFi++UYNUf2LIdVxudBLqg2MwAkfz/9zIgZp66c2XkZZ10+n
         EJJY4VgO/Bi7QMwA0uraz9I57lowixU32UufdaWhLtT+EOuHadifYD4BwIL1NkxzGH20
         sQ4MPGraNPG5L0PTo8vs2fGJQIpiLm0zRW8ohULrKcMbl1bA6ujUZFmK86FUfcE+GrxB
         1cucoWYb4t4WaSBJVsjL5cLWomFIZN3W4DKv6rx1ZbjlQwYT8e2K4bDZSV3Ww4hVWZqn
         8LlnjbO96DdPT5Tw2lhTye9psbGRh11r+LvhJf3Y+rDWDoC9CL8gRjgaZ875BTffQXBY
         gkXw==
X-Forwarded-Encrypted: i=1; AKwUvBxR/v/LxfwWUnxU7OAjXrEskGppd7QVnGwHws8j+D77x7cbwHdmNr4CvTNOkqvxvqdr2wR/gvdqXA==@lists.linux.dev
X-Gm-Message-State: AFuF++kztyNDQR1A4heCenYwO+Mw31acTAgiwrd9BjcG0VPc+o6p4Fdz
	x37xScBzw3BIRDlCcQxeOouod8Gd30Lz+mE2OWVGU/54qnqU8YiE7qXzifJfxpNP7cKv8WdZ7sO
	EVXBEbW0sGmeYnToqkyQIJf1PZk3GWB3C54AJdBz1olveQMrRNxjXkWRNfthKNg==
X-Gm-Gg: AYBFou2Zq2s8a9V1ZXsOaXQmwL9AvfOg+H3qe+wZGvud6itklygBUasGYZAaHBLQKFx
	ng9cmFN6/vSANpXBFoVccqEra2K94lLV/uuQMhGzP13p4mNdyFwUGst5IBqtGM+2FtkjqDYpXLH
	CpiS8vgHN4vAj61qBKywxInYDtxsgOg0lVc47F931rlVwswLOKlgg9LOgQzyL6E98tVJlR89MwU
	niTkHVu6nrCwMYMPr0y/ehVevQMpGQi+kDvs2dNX21G1kPeVdRitZ7YM9UxzDWV+4+Tj0VCAqQX
	K9UJcdHCArbmdA/GA7NA/Bk/fywTojmuxvsE5tiyaRX0Oa1LJPEPWiC7pEeB
X-Received: by 2002:a17:90b:5102:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39dec0bf7b0mr12098932a91.18.1789456601589;
        Tue, 15 Sep 2026 00:16:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5102:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39dec0bf7b0mr12098875a91.18.1789456601134;
        Tue, 15 Sep 2026 00:16:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:40 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:29 -0400
Subject: [PATCH v7 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-3-aa35ebd9ae96@oss.qualcomm.com>
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
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=ly0eko061Qlf/uDE0HQLjreuewjv2PPwW/vrF9/DA5g=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bsm35G913HBN81Wzf3a3bs1NpjtdIlcEWMnePXp
 2bxH8y+dJSyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBEVjczMtzMub34xnGn9l7W
 /zcszmg/suqdseqESdThgMxjHitq5Scx/NNguprSlHnxx8zrkRXyn5eY79dXUuDZkRtiENp39/e
 2T4wA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: WZiJIoUsIPgepglmCEe8nruU_JOn-iNl
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa8f0da cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: WZiJIoUsIPgepglmCEe8nruU_JOn-iNl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX+ZqK/A996mif
 ZoSRW3kdX4eBvs9EP7VUxtjvC11X2TOs6bj3FZKq+1DCWe8SLHwboC5mnClJoHguljPoTzV5VF5
 L0jKnygEDxx6+kp6aCoAVIJ1BvXJBBM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX0hpSEg9jgL+r
 hZXAciGxFP9LpfYmzFsP0GQu9fhRME52Dgn14ORKbZK7BQpJL3iO31Lz4y/A55SXA/3GL6BdEOG
 DA5oqIGTGfgmH2+YwDnEBUxHu2qfHDAod7nxyKvwDeUCufx6RHaTVgIJ5P9DA+uz2BbEdcN2mSr
 IcOSj3MrVdU3T1rM2qRz1h4lu/Hd/u1l+31uOc0UFchAwY4KvwBkaeM+gb/mvuyVRjofAQW/66G
 MRPeCdVqq0+/REx13GH67/gMdCchHSktciDHfEU4wWDC5uX5yDgyqZf35gRAJD/WVmHpzOVmvwb
 a5wASunhwmlzSWxZWE2ixpulrW9i03YJ1m31QvMNzJJlUFYuinr9uGQMOAU7xRLcoKOc6boB/AC
 T4KXx8f6jeWoayTxlZ/HD16T56pSi3P8E33GdSVU4rMamRYMciGnfc30H+tNcxHxlEJvCcPxai9
 Iz/Of7nnhdUUrAJUkcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

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

