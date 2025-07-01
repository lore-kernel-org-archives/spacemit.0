Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29C25C838
	for <spacemit@lists.linux.dev>; Tue,  1 Jul 2025 05:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348299; cv=none; b=KBEtfNTd/zapc8XubNeoZFtsZ39pkVK10bbUYH6DVCN4wEgu790dteyCC4Gmj1QiJptXroBGD/vyfjo9OJmQ+e4dka2jGmMfedKZcoFVSoCp2wP6v8ZRHfa2wP0pXe/L2iBpuEalfhZsPydo7UcO0nhhMoh1MUcXnX2tdVWRNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348299; c=relaxed/simple;
	bh=fKfOf8gVMMFphhh/Km20vvANfTe32lWbtdBJasF0Orc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERZn410Lko8m2sAypyKkb/8IkdgMmUZOCazSwzFqspNejZUGZQKZ87LDWD5sDuPXjANKReBQWAjrqYBo1rm2KKEXCr4cOP6o04hG6j7C7B/1/KIj/M13rlWx7KB/2EM0IVkbkeBkFAs2gFyncKtqNAfjzNm6AV+g21qJvBGH+9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fDYARzJd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fDYARzJd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23649faf69fso24618415ad.0
        for <spacemit@lists.linux.dev>; Mon, 30 Jun 2025 22:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348297; x=1751953097; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBY768blUCx3GgOj3PZ2sE3UTLG71MWHW7v9NvluTM0=;
        b=fDYARzJdQs2IpL8ahddbC/KTGvuN4mlprFUxRX6lxKzvtN5KOi1hLNri05nXtHrCWJ
         W2MY3ZwI55CvATKSZ8iS68+IqoxtQypicsH2Avvj9041ZdaDCzf1N7yiWJuYnYcVG5Ht
         X1QIc/vi1fmF0diupys3u+t3YEoArT77OeLbR02sS71ymhEByiFDeh6tDOH0qrN9choQ
         1MxjlH8Fwsms465lFFt0ZQ1A+ldWXEoTN6EZ7SkYEgar1TNlwRMqpC5CJVkXCsiBNyCf
         MrHXC5XVfhKSjISy4SVmGAm78d0afXnejevjFqi8urgPNGUEhfrzOKuhrX1fUDylXloz
         oZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348297; x=1751953097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBY768blUCx3GgOj3PZ2sE3UTLG71MWHW7v9NvluTM0=;
        b=AKHhkE7rafriKOzckqv29iJiYc+79+KDtrZft7wTZ5CaI4Aj4dHTm333Cf84DpYnZ4
         DvkK2p3X1myM43kRJegqP37C4NJiXnd96nk97MP019cJszPKgWc8rJM8l0ReophJbn7I
         CIS00O8ZeBB0Gt/3K7THHbf3CmdEgBB6DWkdJIH0kLUyjO305BCQFEKiDW0hcLjiMsF8
         5WCsXq/EskyENA7GOoKXB/YxqHqCDveGorPAC7clWDpTEwz52h/r9eOFTi/xvSkZC204
         ULcSAMoGUvJapIjDOez8/I95O1bKWPTccdCLNPX1/vLO/XOKQHkc/0LTaHB4MgOH+m0K
         pENQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhusVnCeS85r1SN4060+eTrE5CzTHt6G44Qb5mBK69Tn6tDUdTX47PcZLIrnqBqCBF7+8qsVMecQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxilpko6I9zx+Q5j3wMGHQN5kKRIVIUZoXxo72j7veGg/Lmyjy6
	S792llnjxthjW+4E5wyUqbGnErF2KqkUbLx88xlKT9DJ78K3vTYfr0b7+MRt5Caob4w=
X-Gm-Gg: ASbGncvK2+3ceT5CtlaCvH6fAKm12/xqbY66bLQ7mlsFLPoRG8Rd+RT48todO0ShetI
	6ER1tjUdnHyEJYQW5PcA91gcKPxOU9PzgOle3GJQqPVOQFj/Be5oSCEMf7lKzxTHZlThAspVHzH
	7ysPFYLnyMXV24NZ9MbzEix5AnpAsQPJUlF53Ah/isf9P0L0f+4a72ZHpvTON+sTjjVbMene6Wd
	VDYm8VmHX7a7+7yXcnVrDl1iRHrgJNboGB5Hj+7bRuaaRMAglins8mQ02cmA65Bi3RMYTUIBVFd
	AEKROOwDwtd1tzHSBWjBvG600qYLEVRWi6S1V3I=
X-Google-Smtp-Source: AGHT+IHwDteRU6Yz8aP+7dgjVpXAB0rA+2JkOitsu+96XwoftfjHHSIxcqXxmNoS+PXV1A0eJAitSg==
X-Received: by 2002:a17:902:d603:b0:234:8c64:7885 with SMTP id d9443c01a7336-23ac48b6862mr236842415ad.53.1751348297431;
        Mon, 30 Jun 2025 22:38:17 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:38:17 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:37:01 +0800
Subject: [PATCH v2 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-working_dma_0701_v2-v2-7-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Enable the PDMA0 on the SpacemiT K1-based Banana Pi F3 and Milkv Jupiter
boards by setting its status to "okay".

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: added pdma0 enablement on Milkv Jupiter
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..39133450e07f2cb9cb2247dc0284851f8c55031b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -45,3 +45,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pdma0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4483192141049caa201c093fb206b6134a064f42..afb88ddf36eb8e5e3bf74fa29f9bc006e45814e7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -25,3 +25,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pdma0 {
+	status = "okay";
+};

-- 
2.43.0

