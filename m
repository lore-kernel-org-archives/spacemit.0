Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B97833F585
	for <spacemit@lists.linux.dev>; Tue, 26 May 2026 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780218; cv=none; b=pa987/QBSmm7njZdAzS0wtDvtQNlmrifcb3sqcx3L/nDj5FieuWZ8ELyV83oYjxXP4wF1c9LkUcWBodT3BcjkDy0JjSTE/BeIEBoIMO8aSG/EcgEZv47OyH7LEhcDBbfSQ1xaGBIoVRIlsAGkWUSM8E367ckqe+GCPSOfsUVCPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780218; c=relaxed/simple;
	bh=AcRMVTLXj/mukKWgGjOXcht9MzRyV0pMqnBZFRrSKFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qsk3rTKTmIcByc5Op7TgQ3h07TLJVaRNinyHlhURMlgkApaeQmZ8quoYDtC/7SW7ij822sM6GYV7gGCi2Ngx4VxLAUlI8C0LEH3xrKqau0EPJoaTweM7A7OaPNjx1PKOIeZevYn6XVLKSzSe/9uirfYd9OIrPPEqvez/ceURz6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RNQHhHea; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RNQHhHea"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bc7b311e77so46716025ad.0
        for <spacemit@lists.linux.dev>; Tue, 26 May 2026 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779780216; x=1780385016; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaTzZIrRiwO1RCeM2bN6zyMtDl6KOzXc9TYKEU25JF4=;
        b=RNQHhHeaIMu1AZE2LAFvPFB/aIf58sO7goqj7tauuof1CjNd/xcE+ZqUylvnVJauil
         ubh3m8tL6Xn7gDdDVZl/YzyWJ8DUUpNQfJVS3/ixC85wHrJklCznlvEYqe8tbDaAlby1
         oElfY0EzmwsiRoppKDgHKF59xEDuBosZbQ6waglKCu98MRps/M+bgWqwI1fgep7+LBNX
         7MljpwJnbAiwVnxKdzsLpyhiXhbGmYwU1jB+jtL2HjSKQ7m2Fc83/ABV3GLCvDVl9aFm
         TuolExmU1pv73rKkWYg6FOnG1aRq5OVB2I/6SswIufXvM1yRKV2As1eGAydNP2V3qHi1
         MdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779780216; x=1780385016;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaTzZIrRiwO1RCeM2bN6zyMtDl6KOzXc9TYKEU25JF4=;
        b=Mkxv9+nvHlkmAnaO5ktm8DElLWTmk3DuYkg5kREr0J7UAOOxaedrqNU8tzPhyNjwGt
         fci/QuGw5GdK/HPZh3v9jYQHRQUzcytxyu3WM4PQfPAC5utRbUF4yVj6t3uO37Ckx+C5
         Z++RaCVd2x0myNuiYn2dx7IvkeAmOE8IDQEXC9mNaX7KifkUsaUn0wnMPFpsfZdo6FZh
         bcR3zuG3S70AFAhFXrajiShCGorECOt2gv958Vzv9TMNDS4ZqaC1bvbgPcsnWo2m+/rK
         ZLdlShGlwWiFA1tniQUu6rQMbohN9cxn1xWV0ySlNx7eBpAZ3CCs1IuL0caK3XHo7BJ6
         hvJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hrGd+DQhypOJWH4Ya5KjYj7QLOikAzeVAz+pPBu+8O9/7t+bTb/sso3ClrSpnZ1mawACcNM+CVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcIdCzDLPQZqqmohIhWomcDbcnAZLqpLJa755qnjyY+z6Lxf91
	Mumd671F6hqhCa/bN2Jlz88N7KcAQkYeMjo1jd+tpeFqCjhCuVpbmdidebWPL1eDZZitB7zeEQD
	tyXznrxuMzQ==
X-Gm-Gg: Acq92OFwHsef0BgnfXxLekGFkcdjkcm1xpkRW12ypQ6MkPhdg3w7m5mzbGWp2/3iYSx
	qs5cQmHMdz7Jo2ZCcOgo1kr8vZ1pqiP5V1B0DNF9hGRqFZZyHyw5ouHMhLgCyaTkeVWWExIbTID
	mui2qHX0LG+BVyGwVaFpc4Txh5pgmWFb9eUI9dtbp8kOOUHdNxBXPs/qknnA7+sdn4SiXg0Cw0D
	YiVehPhSpmzDSQZ1wCZn++fVMd4wxMp4nRmMx94d9WqQ4Wc8PJfC1huYZsqpvaa7Cr2fnsju03C
	XXXI9KugP2lGtJxdj1z9vvyOvI4B59ao4O3LH1Hzo7Zv3rP4EOnLU2EGPh2aCPBgJEIHpqXsFHE
	ChS7EMmpCUVhB3hnlJd9OYEdWr+nJ+LDxXkSn5mTpGwMs4GOjeI6D0n6SfLED+gFssw087j4/yV
	BZj1a1xmIgI10cEW8m9DqASNs1Jv2Zk1GrKut/FpiFns8=
X-Received: by 2002:a17:903:1a0d:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2beb0878549mr150966255ad.14.1779780215657;
        Tue, 26 May 2026 00:23:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm148893365ad.83.2026.05.26.00.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:23:35 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 26 May 2026 15:22:58 -0400
Subject: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100
 cores
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
X-B4-Tracking: v=1; b=H4sIABHzFWoC/yWMQQrCMBAAvxL27EK6KYr9ivSQJqsu0lQ3qRRL/
 25ojzMws0JmFc7QmRWUv5JlShWak4Hw9OnBKLEykKWzJXvBl8OfhKCZcXBMsY2t8xygBm/luyz
 77NYfrPyZ67McEgZfszCNo5TOJF4K7t+GrtBv2x/hkXa4jQAAAA==
X-Change-ID: 20260207-k3-ziccrse-b3e2d4d43aec
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Guodong Xu <docularxu@outlook.com>, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1

Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
provides a forward progress guarantee on LR/SC sequences in main
memory regions with cacheability and coherence PMAs.

The SpacemiT X100 core supports it per the SpacemiT K3 hardware
specification.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index d4be8de8fc6cc..ccb483b439c5f 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -36,7 +36,7 @@ cpu_0: cpu@0 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -77,7 +77,7 @@ cpu_1: cpu@1 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -118,7 +118,7 @@ cpu_2: cpu@2 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -159,7 +159,7 @@ cpu_3: cpu@3 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -200,7 +200,7 @@ cpu_4: cpu@4 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -241,7 +241,7 @@ cpu_5: cpu@5 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -282,7 +282,7 @@ cpu_6: cpu@6 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -323,7 +323,7 @@ cpu_7: cpu@7 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",

---
base-commit: 5d67b1f204472df70f7c7189c01fa405f3ccb503
change-id: 20260207-k3-ziccrse-b3e2d4d43aec

Best regards,
--  
Guodong Xu <guodong@riscstar.com>

