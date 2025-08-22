Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C239280327
	for <spacemit@lists.linux.dev>; Fri, 22 Aug 2025 03:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832032; cv=none; b=K8GTDRbk8Yej+n0CZoc/61DfjGZpADTrUJXWrgwvf9+FBnIXFCWgWC8Ixk/iqz6TKkJpmTiZFlCmCm8VNwaToqnmsKqJLXK2POG/Udft2udL3ggOwttzRBBx5S5TPO6FnNIKUu1KIvov8E4mI01PkhKFzVTnwOHFG8ug7JPZHM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832032; c=relaxed/simple;
	bh=It+6CdxdN9UTL6bK8NFWI1ps3A88WSuPyJvweDqSJhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXApOrHn6Kayly4BZ/Ar2P18jf5Cg66oeVAOfpT9iYgGRxkF9zfrtARyhL+h/kfJNmaygLf9+1EWMrjJTSnVZXW2b1pfOff0kJLsiFzh0C1yC5oJu2QaFHWtTchI3LQ3HahYGhPvi+LIsENyH9PvsXsaYtLuBoFKLm/TUs4m2Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pauVHqQN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pauVHqQN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e6cbb9956so1351108b3a.0
        for <spacemit@lists.linux.dev>; Thu, 21 Aug 2025 20:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832029; x=1756436829; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBarAmiAVNczS9KrycJoO+goP9AfyIOpybp54mi0NCk=;
        b=pauVHqQNtGqIKTPBZWyCASRxBxevTZH+3C8vVhJPsy5gf4cKglxxWwKAZqgK3Koj0f
         fakKMXLgn+HamYd3llneVFnaVSAJIDozvVdRuB39vlldbiBpBWTxnHaZ96vMYc4XioBU
         NIE9Uj9IHklgn8v1zkhoVedRKc19J9Sr+nLiiZPJ0jIRlHwsxUYpplsiDManwW6gtzjJ
         RRZwnE5k8wQcnzVzwGTakFmLA5m68B69faw4KFCfPI8ifGMZGhs6ZwO+fLVzNKfT08cy
         iiQnF9u9b9mV/X12YsCYA/00cK/4nQlHH+qXKkvNMGpKfwzlthjRa4F4nj/10ImBzl1s
         /g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832029; x=1756436829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBarAmiAVNczS9KrycJoO+goP9AfyIOpybp54mi0NCk=;
        b=NNEJcTspxngI/ZnCFgRrHZtgSXGyezjEr332SnNds3rbRAaf4gyuYmAaw9aYJfDq7h
         7GTcNkVQD15Jzn0aH2tu6Yw81MafsU9NSkLn1K/xmyawl+lI4N5JYxZQ0KG7iTwY/Ko4
         oZfa30QmsibeCju/7mBqvLYISvwPd5X+YnP93Z8d2OS97lf4OGcpSxPv0mik9KmKtbKr
         73WN7Y34mDHeK6soqZEXIzXSgzKpdL95qjJ5qK/Z5eTDbDyJV4U+46e2FYQBkRHKfnFU
         WLkUIYZyPnwqSbabLBGUL0N5MQBDhItb3tDw8ZTnoM8v3/ZJ1uwcd8mq44370QcUF7f8
         DY8A==
X-Forwarded-Encrypted: i=1; AJvYcCVafY5AvgeiwUZ1GLep4J88nzRq2hLWlIhge0b0i1eOL3CtBSyUXcqy7dMielleHMwToA43la+8jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxJ5z0j/EUvNlxJrF6K6RV4R/sBzWu4VdWL9lryHK0GnKynYRM
	6GkRHy5pVgwuuEPMG0OkZfCokn6OVL6g0bzt2MDJqQbP0em5L/U4RCClio2biIJ3FSU=
X-Gm-Gg: ASbGncvZL+W9zWTxvSbqyJS71JlUM5Gh/KK1TzjrSsFaEfaUJzqMxrJtDDQHDHWt80i
	l7MqyhhkKdcrvVgl8BmkywAS0IMBSz4jzS8p2zFmx/R0qieaG0Zk9J49hTR8aSSH7ge/5jK+OMr
	GksM27uvIsvpMh8FwnW+jraOnHemI+y1uAVTZb27tx6+Yb8tNabf8tLMG1SOUb1Il2ahLt55pFT
	ptf65DAg4cyNKCCpHE7nt4KToeyTInKk8SC2+KlC1GyMpDo5zJLtmgjf8z0fb6FeakG90lnkKzZ
	AY3OlbT1aUYtgQD957E15KVR9tpy2FKObeSmTwvQ1Me9xOGUZXDJ/16FM5JNTtFrYWfv10t6uk1
	sq2xSfYQ983SSaOTeW6uMFkWDil3/d/x6Lg==
X-Google-Smtp-Source: AGHT+IG9r1IW40WvsK0ieNWX502Z1iaJ5R2nE5AB//lCMTQKx+lUDc3v2aZziBxwICd17ogNaz3RaQ==
X-Received: by 2002:a05:6a20:2445:b0:23d:58e9:347a with SMTP id adf61e73a8af0-24340c964femr2260198637.26.1755832028794;
        Thu, 21 Aug 2025 20:07:08 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:07:07 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:33 +0800
Subject: [PATCH v5 7/8] riscv: dts: spacemit: Enable PDMA on Banana Pi F3
 and Milkv Jupiter
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-working_dma_0701_v2-v5-7-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2

Enable the PDMA on the SpacemiT K1-based Banana Pi F3 and Milkv Jupiter
boards by setting its status to "okay".

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: Rename the node from pdma0 to pdma
v3: Adjust pdma0 position, ordering by name alphabetic
v2: Added pdma0 enablement on Milkv Jupiter
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..6013be25854283a95e630098c1fde55e33e08018 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,10 @@ &emmc {
 	status = "okay";
 };
 
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4483192141049caa201c093fb206b6134a064f42..c615fcadbd333adc749b758f7f814126783f87fb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -20,6 +20,10 @@ chosen {
 	};
 };
 
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;

-- 
2.43.0

