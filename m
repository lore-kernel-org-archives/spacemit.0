Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51C46A608
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456597; cv=none; b=hb61jTAKhPYDAeOH81zsR5u3kOwaDTHq5BJ7UNwHiyKadKh8KKCrJZOP6VrfJzECFSNmu0zr0L5VmKZ7tv+KQve9zCDEqNxEEjaNw/7H8VdObdLSn5bDSGvjuTa6H8St29WkSlFSzQ7Oqpoi2vYfzwo1YGroL/glCNxEtDqRh2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456597; c=relaxed/simple;
	bh=NF3ddzUfo/3eIQKDC/wsRnOuXvG5lgOW1mkc/KT7w9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bg/RrAWQuCa0/P73JrPTcNIGly1ucVqCCSB02WhN5tabDqufaNe/6VgwrlgkWHvQWYQbVQxwqLKZ/gEVE3LUJpvYdsigLrzoWFoou80CwIsp4FtqFbfo6GnUhH7dFfPHcFQfpSZ1WwDUJ50stgAfwBADyl9N/xhTltI3XhUxKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfUftpWX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbvnkAq6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfUftpWX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbvnkAq6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Ywe24048660
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qgmlv3XWxHqYEcDtaQStAaCiJTua/7d1HfjcjuBqWI=; b=VfUftpWXJpGHZevx
	5UfeudRRRp4y2BVM5eZc9U3nHz0ehqU78Sh1jKTgPHEW5q+rJYa/fQdS6WoQMULf
	228jVwdemQSI0HtwEmMO0WuFqWoW6lKplxl9ezpgy+GBmQnYiJuPSQSbTVGGmMW8
	0GcCCjp7yKqEHSSMNiYNKn4x4gD23uNYzUiuF8KcDLQWyfgIzpswozAnLjAMV/x6
	42hwBQ4W4vYFcM+UtAPrDWc1YvfV0vtYz7CIvXIg3fRAeezfDyU53t9hPUN95JUv
	0+/A29x44bgmraiQLwp9PTWvelYo7Rd9cEIRXZ5+R8HkkCeYxXxDVqrcAvNhe53D
	FBPN+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea0h9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 07:16:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94a158dc8so61570725ad.2
        for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456594; x=1790061394; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qgmlv3XWxHqYEcDtaQStAaCiJTua/7d1HfjcjuBqWI=;
        b=YbvnkAq6HyVzeqnGO0RUDIwag/QHeJuD8I7eXmJ+b7qxd7IOFhBI/4CkAz0LDJ5RYz
         S0ukY/vUjGAxZQiROntUHG+oUufENt6wBCsEJnaiPQ0VRmeqnF0Hy9vuykrwcBFrZnaZ
         t8DVhKPu0Rtk8stAXMyqsy+yS56SUWHoNz+WTEQDlStBolgUTWAZIEFVHFr6vjiaA2gH
         /hS8dksjaGUIoUE+TEQydSpVdkCmDlOsALIg1zzrDzQSnU0yjKMjcLjOOtPhs7vZRmLy
         u5GEliJUyu5I6o6Bzzxid4ntqKJuSfsMbJMto0/T0FNSQWu/ppWG4OnE8Ca/Nsbnt6CF
         +o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456594; x=1790061394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qgmlv3XWxHqYEcDtaQStAaCiJTua/7d1HfjcjuBqWI=;
        b=olWGDFXH0wHIVGkPKmmApd13kBfx8sFstSR+u+oUXJPeHQ9QSaFHKC2inVk3WZ0/Qr
         1XQW71FmEbKdo761r/WjcFrDWk/WTAvohJeJl6ExOJGEHs1PwmnomVbkp5wdaofIYAKB
         Q/cgaqK/ZXlDOmqrWIjXd5R57gJcwsnkZApP+U1FmiwX0rHupnnd0BcEO/B2WRsx7pVz
         UQZFG3zQcvrKr0WWGGCYBy2QtWdi3unYqORe9VdFZTS4hMKIbr36W7wQf/52cTgVUSOI
         smTaKUAmzW3NY494DT6nch6FdkBX7s63ioKtJa35yAuZ9DVSq43rIBIUd7t/7WNxq8PM
         kQRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjkF8lrn3DmbX1gZ3PaYJxTxDl4U3whmgj6MwLcHOqCntrlbnZNnSAagfscUzla2n1nbjQ2RV8GA==@lists.linux.dev
X-Gm-Message-State: AFuF++keLCD9ibHakeJpmZitkaxb5EfsQgEAvF6uTi50HNBvqnO+TLqy
	4bSgycxx5Wa7AjLPg07UujA91yicxgsjVhlGuTYDtTk8cQy/mwYrIhAEooWYdoiOE/cvlv5cQoD
	OXVg6POs4hD9Q6HSPIm3r5hCdHNWR2KXBqkAbwjIGnZ8p3YCQ+iZmsm53NJWv3A==
X-Gm-Gg: AYBFou0pXXR4cDrbYmi+WUKB4Dt+UJKskJmUcFC7LF4vHlin/NTQQo7PJ0nULK+4pqZ
	lGytReEe7xaMUQ7+cBE+Wtm6cCTLfOeSVh0EwP05k+1UMlrjux8e1SGT/eu3RCvzcVgOimGx1uA
	csr6csdnKKxnAYjFLUvVD3FSuI6NtZnT2ynuv1J4lTbTCNzNetMMhN/s4P25251PskhjaSkWn/S
	5OEw8A5V5XCPl8EueLhceOma1vOlNNy3clFAsTwek7cJmVmReXgpOazQ1PAHFiEzGhAftL6QpgT
	+VKtYpDId8GhYlzZ0Lv/nirrwQwHfP8UYWSf2B1SHm7kZBnjtdLZ50W4JlZ0
X-Received: by 2002:a17:90b:2d85:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39df2470c15mr9173011a91.6.1789456594046;
        Tue, 15 Sep 2026 00:16:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2d85:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39df2470c15mr9172925a91.6.1789456593323;
        Tue, 15 Sep 2026 00:16:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:33 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:28 -0400
Subject: [PATCH v7 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-2-aa35ebd9ae96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=NF3ddzUfo/3eIQKDC/wsRnOuXvG5lgOW1mkc/KT7w9Y=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVHzZ/n6Trr5fvI564+4nNYeGWkuYyO99AjSSOC9LtS
 fy32g51lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQEtzL8M71hEnLuQoO9upod
 l829vIBZyU1mC7U8ls91zHLd5GCjw8iwuozTenZW2cvGB/xhk4Ky6zR41rBdPMvi9/bcxhMVC0/
 xAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: uPnveJ5VbzZ2DYLTHSebFP6gK1GrKvXd
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa8f0d2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=JwNH_LCS6ezfG0-7a8gA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: uPnveJ5VbzZ2DYLTHSebFP6gK1GrKvXd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX3AIHT95f3Ut6
 k0TkvSBR79AMcQVPM7RlFfTE9kXypjD3SVehpkzNZ0Rg8jdmuOsek2JUO8/kTv181j5ve8ezp2U
 2OS81qI9bCbHjtV7LygxeCwIB7tbvfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX4ceSrSc3zAWm
 lMqQsY0niQyue3Dgbsl3ItMXQXlEEhFRv0Lz/81vFMlafn4dmUfESDl3VuYZ4smsOiubKtKL89m
 hkjjv5NsbeX/Q7l4FlqOzmACmhbQjoYQTH9nkqdDj/SGkUFGPn8EFVXStB7Ymp41keqmeWJvK4h
 Y88/65bxDvnY8pKaNwwozP5tBuH8VKR0k3Seuj4hIbpAFdOhDnfPxDG/HEQqQvJfgbf5MB99Uz7
 +fRhR5Vggj3zl33nZC3rkeV/3klwje++QZwfOedTdgJy1R4DnMFuSPM/RyGBv+bTq7HYDnFb/nv
 5JyzAt1iNBcER/KghIXCtcJYMKVS8IC2yZ6I7u+F0Krmj7DZ7kQf/eUimTiYHd+dpopMdEWTe6I
 js407vZ3mhdSezf+p/FFhte19vTkHFxWhX6JKf31DU6fUYJ0JlTL8hRqRo27UR5lM/Y7lT1HDb0
 G7MOwFtO/aQq3h8/gKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

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

