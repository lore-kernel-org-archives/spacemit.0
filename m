Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB06C285058
	for <spacemit@lists.linux.dev>; Tue, 13 Jan 2026 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290389; cv=none; b=aYoeYT3CBqfQ2ZRvDBKNwwJS+haEdshnlB5Tc2peOVgQ+zuSiRE+c1FJaX+RhYXr5vkScAaNJw5PCPjPp8x4kmpKhnMmnCr29UJTjTHkaeUDEmF8Cpx+UJbYi5Wpqw5VbchKMiKZXUvOlWJTiP+r0jOzLsjh18rAmeHrUW+mD18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290389; c=relaxed/simple;
	bh=OHMTD6mvjVLmXb9olG7pakPz63ZWadzJM1D+Pzj415k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BTT0s4v5wJXLXsP+MUaQBKF6DKVaNhurL9gf0MWJG5G56Wd1L5n2ilfwwcWbfR2O9asAOzsxFv7/eAfYGh5+kVTy1Xmcyg7ZdSzPaor1K1x2ZnuNVJDpHHuCYQKPkGS1LXZEMHquZPabWyEbhADLuUTKyVnumonFCTxgFoxRDtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=V4jUua71; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="V4jUua71"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a110548cdeso49467635ad.0
        for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 23:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768290386; x=1768895186; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CjXm7ZFbZN2te+mbZ4FufAt+vGFRDn4qFlHrXyIeIA=;
        b=V4jUua719DEB+GgBBKmg7C2tAAsioYmaKGtlCjdB7hdZpQsuBoMUW/sgcj9nS92au+
         yLG9faGnGsC6C7aiZVGppT7JZqcC45RuSDpiixrs211Ludl6tRXeZiIag5VULCZBdiwV
         al5JWIpJcklMVZTz1+mLFETMnITJjEu7fNsgNQAuZGs28AM2EEjL+Ix8KEAN4P7eL5ta
         orU9KzDQFGnDIh9URxS5S/p77bKpNDUG/MsnyZSO5hEvHEeqnzXCVjWz4+kGn2RMVzRV
         OBQuGtcjpKe6mZjVuxkhQbcTaZiqyVWm+zVrQWd4nclDkOq2k5+vNyfYcj1uDdbgoaT4
         zcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290386; x=1768895186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4CjXm7ZFbZN2te+mbZ4FufAt+vGFRDn4qFlHrXyIeIA=;
        b=SMQ/VjUW96FG1QNMzIK0uioDvjO3KlOwu9CSA6HDmJAzwVT1iBuEQmmOPTqCGIqdsC
         rVvMRIF6/uNlkW92UOWHC/EsX6CAratBjxa46kzxsTMZJoG3MDKsavsJWD6dIk+nTRid
         J8KXsnZ2H9IMmCGy1cHQ/Kwa/XQxjoQbYMlKidW+AmI8zmPPh50oEQG87BzmLC76hSpD
         949kDw0kGFFhFzG3TXNGH+J/O/J0pRhozijZUhTyY4g9BYULcTxyUcG8LsLXPNANE49o
         BAutEP/Qe8lu0gA4FMFENU5qdGd7mSimmxXEbB4w9jTYix3SvDx8CfQrWTGx03lGxAUS
         qOJg==
X-Forwarded-Encrypted: i=1; AJvYcCWYZUxD4oPHACxVij8bqdffoYn7ToyUTkI5nlL/vlvmVWW2P7mFTHpRMsSjzBStsSu/3fNFJzw0/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7lrZCVdM/drkT1PIr1XZHZDlPjfLfQRfmYQikjl500Wl7Q3OS
	W1zIu6N3TLrUKhJkS0nEywiAcSKqp8fumq/GlJM7jUG3NsgbhOVelhDIlwASlH8i7YY=
X-Gm-Gg: AY/fxX6CcNvxFch03VGzIeb07a5tVFtB+QxeAhxUaFYTZ//TzSSmJnNjiUqZYBeWC8F
	kYRWuCRFCEk2Wx29EuWJE45Xm4nHbF/HSPyfPoW5L5yAkMizbYgVlyJjUMoRz0i2XlfZrxQ9Ylf
	eIuTiyVqUunW2htkSi3dnYV2TH1i1sgk5ALzFnlKPuMgQKbB1iBatsDTO3lfAgLjXggOpUFGece
	Vp7JO20BQ7lJzd/wh/GlCEqXOeyyZSZYxx/5/wwRdDuAzw+3OCmsQNkNFgY82mRkzw8HGH18Iup
	Fh8/yJvssYvkcyaC6zzdv+UjOM1yZ/xhXnfS/RGdPMmkMw0vs6bQokJZRlGR2/j3PtBC2aD/eVW
	XowIoj0NEclJeXKKo6YqkKlKEmAvbBQG/DKdRqrgDUfAN+ayzab2vSIjvNyMUpU+tSsIqoNwChO
	0YU7XVooPhtu9BFoSxGbEzYK8tUId56zLKxT4DvQyNlDqpiSJ5oOAIcA==
X-Google-Smtp-Source: AGHT+IEtfxvE8QKKhCFEr0sgtwaNG0lOe7lCzN1GyYwvIvldk9sYRgUVjb3dpl8lLAX/fxKuhy9oLQ==
X-Received: by 2002:a17:903:234c:b0:29d:6b8e:d565 with SMTP id d9443c01a7336-2a3ee4c0e80mr168277035ad.38.1768290385628;
        Mon, 12 Jan 2026 23:46:25 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm190956165ad.102.2026.01.12.23.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:46:25 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 15:45:54 +0800
Subject: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
In-Reply-To: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update existing devicetree files to conform to this rule. Line balancing
is performed where needed to improve readability.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
 arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
 3 files changed, 147 insertions(+), 146 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index a5d0765ade3231ece0afbe8835d95cd918a44ad9..9fe183f5f5c8d3a51ef38384ea11147637aff8cd 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -27,8 +27,9 @@ cpu@0 {
 			mmu-type = "riscv,sv39";
 			reg = <0>;
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zbc",
-					       "zbkc", "zbs", "zicntr", "zicsr", "zifencei",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b",
+					       "zba", "zbb", "zbc", "zbkc", "zbs",
+					       "zicntr", "zicsr", "zifencei",
 					       "zihintpause", "zihpm";
 
 			cpu0_intc: interrupt-controller {
diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 523799a1a8b821dceb476e8bdc16e5c372e04d09..3135409c21492fc69766e6205ac3ab2b571a8718 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -24,10 +24,10 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -60,10 +60,10 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -96,10 +96,10 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -132,10 +132,10 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -168,10 +168,10 @@ cpu4: cpu@4 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -204,10 +204,10 @@ cpu5: cpu@5 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -240,10 +240,10 @@ cpu6: cpu@6 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -276,10 +276,10 @@ cpu7: cpu@7 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -312,10 +312,10 @@ cpu8: cpu@8 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -348,10 +348,10 @@ cpu9: cpu@9 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -384,10 +384,10 @@ cpu10: cpu@10 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -420,10 +420,10 @@ cpu11: cpu@11 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -456,10 +456,10 @@ cpu12: cpu@12 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -492,10 +492,10 @@ cpu13: cpu@13 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -528,10 +528,10 @@ cpu14: cpu@14 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -564,10 +564,10 @@ cpu15: cpu@15 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -600,10 +600,10 @@ cpu16: cpu@16 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -636,10 +636,10 @@ cpu17: cpu@17 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -672,10 +672,10 @@ cpu18: cpu@18 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -708,10 +708,10 @@ cpu19: cpu@19 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -744,10 +744,10 @@ cpu20: cpu@20 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -780,10 +780,10 @@ cpu21: cpu@21 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -816,10 +816,10 @@ cpu22: cpu@22 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -852,10 +852,10 @@ cpu23: cpu@23 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -888,10 +888,10 @@ cpu24: cpu@24 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -924,10 +924,10 @@ cpu25: cpu@25 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -960,10 +960,10 @@ cpu26: cpu@26 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -996,10 +996,10 @@ cpu27: cpu@27 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1032,10 +1032,10 @@ cpu28: cpu@28 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1068,10 +1068,10 @@ cpu29: cpu@29 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1104,10 +1104,10 @@ cpu30: cpu@30 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1140,10 +1140,10 @@ cpu31: cpu@31 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1176,10 +1176,10 @@ cpu32: cpu@32 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1212,10 +1212,10 @@ cpu33: cpu@33 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1248,10 +1248,10 @@ cpu34: cpu@34 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1284,10 +1284,10 @@ cpu35: cpu@35 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1320,10 +1320,10 @@ cpu36: cpu@36 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1356,10 +1356,10 @@ cpu37: cpu@37 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1392,10 +1392,10 @@ cpu38: cpu@38 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1428,10 +1428,10 @@ cpu39: cpu@39 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1464,10 +1464,10 @@ cpu40: cpu@40 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1500,10 +1500,10 @@ cpu41: cpu@41 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1536,10 +1536,10 @@ cpu42: cpu@42 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1572,10 +1572,10 @@ cpu43: cpu@43 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1608,10 +1608,10 @@ cpu44: cpu@44 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1644,10 +1644,10 @@ cpu45: cpu@45 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1680,10 +1680,10 @@ cpu46: cpu@46 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1716,10 +1716,10 @@ cpu47: cpu@47 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1752,10 +1752,10 @@ cpu48: cpu@48 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1788,10 +1788,10 @@ cpu49: cpu@49 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1824,10 +1824,10 @@ cpu50: cpu@50 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1860,10 +1860,10 @@ cpu51: cpu@51 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1896,10 +1896,10 @@ cpu52: cpu@52 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1932,10 +1932,10 @@ cpu53: cpu@53 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1968,10 +1968,10 @@ cpu54: cpu@54 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2004,10 +2004,10 @@ cpu55: cpu@55 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2040,10 +2040,10 @@ cpu56: cpu@56 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2076,10 +2076,10 @@ cpu57: cpu@57 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2112,10 +2112,10 @@ cpu58: cpu@58 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2148,10 +2148,10 @@ cpu59: cpu@59 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2184,10 +2184,10 @@ cpu60: cpu@60 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2220,10 +2220,10 @@ cpu61: cpu@61 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2256,10 +2256,10 @@ cpu62: cpu@62 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2292,10 +2292,10 @@ cpu63: cpu@63 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 4c045da95d72d840fdaa9240136e35007317d987..2917b315728ff839fb43f77713224907bf2d5cf0 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -54,9 +54,9 @@ cpu_0: cpu@0 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <0>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -84,9 +84,9 @@ cpu_1: cpu@1 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <1>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -114,9 +114,9 @@ cpu_2: cpu@2 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <2>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -144,9 +144,9 @@ cpu_3: cpu@3 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <3>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -174,9 +174,9 @@ cpu_4: cpu@4 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <4>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -204,9 +204,9 @@ cpu_5: cpu@5 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <5>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -234,9 +234,9 @@ cpu_6: cpu@6 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <6>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -264,9 +264,9 @@ cpu_7: cpu@7 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <7>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",

-- 
2.43.0

