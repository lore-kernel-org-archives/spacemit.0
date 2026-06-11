Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11883A3826
	for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208870; cv=none; b=Re+bq+NTd8d8XRa/aP0offESaHKRudoloD7qlewW25DQBqbKYrV7B67PdfpZYnIq5qOf+9z6XoKZl3s5yrG+XVy90K9FY16o4C5nSmefWwa/8eqxxUxxUiOpcT1tEyGXmj5hN3EfmkcyjOTBXsKbTNGY5/+cY60UXqt6uTmQ4os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208870; c=relaxed/simple;
	bh=1hC6zzKA4CJjQriIWM3CQBXPR2A8kSqDWjw+47N4rD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X59gtGpw8ID9eMa8s4KETTqb8Y88T1hGRfMUJ7NLqYqL4P+jPAAi6MnyyxrCUJNEn0dJk2hbpkUv4K2G34UnJ+wqIaIZJd6KJ5EzcV6DeT9pF5tDb8g/1orkhhTuRmWCv/RUw4R0nbL95kyQ0/3RM1a5zjywpCTJUYbzYA8fn1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMIvfLME; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMIvfLME"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0a5354da1so2950965ad.0
        for <spacemit@lists.linux.dev>; Thu, 11 Jun 2026 13:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208868; x=1781813668; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWGPbpmqg0lH1ng2byOCnVsoEWVWZdy1zTkLpAItnsc=;
        b=WMIvfLMEI4YKLn3D2qMsNI7uvAzZwtMQa4QapJQhwQ/yzUP47UHwT98RDK3TJKV7ms
         3iJ4kfYqOkSq387wgPstxm7NLarpMyS0caQe0teZfLicP1MyuYxVoyLjCtYgnbDQ3dfk
         OP3VaaHpgd8JNWU1S/7hbHRe10WsrO346BAvcq61lZygS3pfJLn/9LHvHQOC4so7TsE0
         5yzCCX3T2gVf9Z/pbVB0NUvZ2Xk96TvA1PZ2aDjaLurjPw0dabt97c8RYX4Fc6URA7b0
         oPM5FXUkHNeSq859g5xpjnO7umq4cxugdeRy+UgeLarbcu5vOf3zdcvQW9SvxOM9aX81
         yuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208868; x=1781813668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWGPbpmqg0lH1ng2byOCnVsoEWVWZdy1zTkLpAItnsc=;
        b=LILxAk8JRbc6ccZ8WaFtXA/PJLbYABUs6wJv7sxXAI1sdYugsJeprv3UCBfQUNWvJb
         0hQisHG58g37gy1wE3ME2gE5Ss/zZQ4+H2hI18m/Km6Gbg38y8ibqCXzqvU8p15UmT7M
         9PZaUwob151Rv8OZUQVedlQmqzTRoTCN2QKpUdZteIO+7TdOqOInUDV0WYC+5+ZG9a9o
         QbznFk//xsZ+sjLVbjenQ8VU2lslByKKQlzqzbYsWS/2t+C7rsGRvEIkq1gMhprSZAvz
         +VFNTP+wVnIbTj/anqYdZREXeT+pho5TVN7OiKVV44CfkRW9xfqcszAF+8mGwqExaWP3
         pmQA==
X-Forwarded-Encrypted: i=1; AFNElJ/pcBtHJlNy1mcws3IVc1PZXJKDOWsS/jlWIvgfIvo2epCyw1yYqdtWJhpALMTxxIfM78CKs22p3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYJ6JW5PAV5B7sw3zs9nl4DxotGK19oySU6Moh5HbmZnqBi3AX
	i1glbYrxobhYrsJqnemw3O4CHBbKl3EMl4OJVAGrZ5WUYPJbWkrmIH0g
X-Gm-Gg: Acq92OHNFwFsUI4h8PZPLLJ763trR0igj3u3jE5McRmHyPOTSIL9vDWZz0vScMOYIoO
	ipic2RwYpciK3xG7d1gcTc9XG3mhz8IMJ2YWM+23yMQDBVf/WpChlmapq31Gvo/zYZ1T0AB1CSX
	f2QSxQxgL2Hcgj77I8vy5yJ8L9hilz9/4PWww8xJpcHxwumvt2dW4xINQkZS5gU+PxBxrrBsov8
	vEhV2vVzt7Pi1pba2YRPvISS0F1+nh50sV0CqMSd40/JelixsynO45Lh2yAb+ws1rP+dPY3kDRa
	q98fCtbw2heD2ZKvrkMjyooPHdh9QF6M1KLug2YoJ4iXUwpmxTaEumQ65CeECaAFfciWbihF1W/
	t869YtSaZDR0ne3XxHW8AZtjJma/ntFI04uL+d+xYEGHYwXu/jMHBo4Vz8cwrAjdp+L33lYHzFw
	==
X-Received: by 2002:a17:902:d4c7:b0:2bc:977b:846d with SMTP id d9443c01a7336-2c402bddcb7mr1128965ad.5.1781208868292;
        Thu, 11 Jun 2026 13:14:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:28 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:47 -0400
Subject: [PATCH v4 10/16] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-10-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6777; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=1hC6zzKA4CJjQriIWM3CQBXPR2A8kSqDWjw+47N4rD8=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsUNn27892F2bsvL8+ytHsyfXaLy7eWNDd+Bp1uDv4
 v0m5Ud3d5SyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBEnB8z/GKa8FD2xNq8g+zz
 pJc+u8e88+GfZwvKUkKurollbTq5YpM6I8PSrg3tcwoOdjqtL/Ssyi3c8u3jRamnLhVXA47z79k
 gqs4NAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 4ac457399b583..b5aa983f0bfa1 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -35,9 +35,9 @@ cpu_0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -76,9 +76,9 @@ cpu_1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -117,9 +117,9 @@ cpu_2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -158,9 +158,9 @@ cpu_3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -199,9 +199,9 @@ cpu_4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -240,9 +240,9 @@ cpu_5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -281,9 +281,9 @@ cpu_6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -322,9 +322,9 @@ cpu_7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",

-- 
2.43.0

