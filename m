Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F5D242D9D
	for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486056; cv=none; b=p8KkHnBytoIfavY6aRYnTUSSqxuT9iO2UXPy0UNPBF0huwuSk/XVzlsCtc0WB5O7HJKM9+jMr+79NlBFMEBI211S9MH+kMsg80ROYU/pcJVIJHNkUuXXt4QBMY/pCehFW6GnMif4Ynb0fvefqXTGKSTaGTH+bjjiPz2aq0U2FtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486056; c=relaxed/simple;
	bh=hAq0x+oX9cbcJkUs7e6ehMKp0TSf4ywLJDhNt9d1ea4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXlkycPZA+eqfjoomfJdx93a4angvdJLwPfO2vJLM6CSDG7owC3w58p+u+TrGzhdzT9IFF4pF62LVNGpA9X78OB6lpH81dKO0qUxH8hgcTRwVHwxTmtxQ7JxymvRCN9fFmv1Y0pOWV3f2ZbIAFqRM4klb9ZpW5FuF362ENwTquw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TVoKkjLN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TVoKkjLN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45611a6a706so5813485e9.1
        for <spacemit@lists.linux.dev>; Mon, 14 Jul 2025 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486052; x=1753090852; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ldfd3zKYA1234Y8Fp1Vc0yI6IvJCQoMDmBQmNhJG3pA=;
        b=TVoKkjLNVg9ZDu/JjbiwPq9dq2g+it9UmW3F1Ucxm75zEBuW2y+ZxdjH0H5x/8ZDi+
         ZFttzUc8lkw9r4L+MWFu7I3a7IRXPN0OaWap3BwZ1oTQ7VpdUgTxCaQSM9UGCqSteLSl
         D1NduJV2asNcrol7TlLdMgIzqajFm1lH9GPkNCU/Q/yAq41jDXh4nXtRgTstWTa+4cc4
         /excmwg1eS3Zwz7Ia8s9QGW3qYj/c20mEjtXD2YStTG+tBrpUcePa4nUAUmjWFim0Evd
         HFC4f9ogA22jgisrPil8sT+Rr970DGxhODW0ZnoUeAS2JgISx1VZXy3nE+cPsdEJROxO
         z1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486052; x=1753090852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ldfd3zKYA1234Y8Fp1Vc0yI6IvJCQoMDmBQmNhJG3pA=;
        b=dk7onjbB0erTjM+ECMoccwdoARzA0jczfPtz9RboGgngetZlXauGQqSdhdgTVVmbtb
         jwzHZNx2azyAUPNyrj8hz3/MNcYNf6g57mN7QN5EbMPM/UdCUEcmXmtE3iisRnj5Uw/F
         KhHwvw7mccvffCI42e/bZVeetv34Qd3M/4SQ6Uf4qVyKZSS1j/Siy5g5mXqNmmG8D+ua
         HCzbg8NjM2Kv1uvC6nOvggWf/YeFSTS1VVR+ybNfYan+UmRWMJSaJLYv8uwS5pAEEMSu
         LZLvjTzK6JCl3G58/fiOxDuzkTVEoaETN0YpCsfN/CjmE0HnXb+l5IBss89MLasHFNwv
         a/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVI2kj2LVo22LBPZMCKWsod/Ks/ZFAylG1vwiAQ6V3GcxBv0fzWKVsSbgkkEX1R7gSAvLU4OrK6pA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyem7FLhDNbKHbLbK87rHVtdJJ0PaJ14SWgvpj4eFyuVaFi7Inh
	tjD/rvk14wfPXzTskhh/gGMr8LXvgImvfRBl/QNcObUOiqjn/o6gY16AsqYNye94OWQ=
X-Gm-Gg: ASbGnct2jGMJTjSV2Imxzl+M/fJNGMHlCOI6gfUCRId3rT0gHzgCGoCwM45Z4OsJgey
	HszfD3nsEaN5NjKITGvc0vjtSYoD3LdcdEns44OaVFBFZjkwkQ+E1RI15kYQNGY63/INkgAKCs5
	4dg6Lleb2jEle9JnMha1QcHv6o4pmoBrQKcxOMeSbTPnK6+PrXcE3MnKnzxYpTLbTPzFfDpV1eO
	vxWAvTW2CrYZIiD29yQ5uXqCw91MthTH77TYf3eUtZalQSKl31jynRrsw8zC+fa9VC8fhnB6co4
	035KV36hHYanMxjKxVfVs/yDwoeGTze8/THxwwdCiJgzBXf75QoZscM37GHPiuFrZszcNa+itQ=
	=
X-Google-Smtp-Source: AGHT+IHBUTHXXfV/sAbab2DTdMAgIRdSFUuzZnhKWqGYxvLkdc88i2Qw/Sud4EEPv8EFPz7tb3aRDQ==
X-Received: by 2002:a05:6000:270b:b0:3a5:3b93:be4b with SMTP id ffacd0b85a97d-3b5f189621cmr8029790f8f.25.1752486051776;
        Mon, 14 Jul 2025 02:40:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:51 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:34 +0800
Subject: [PATCH v3 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-working_dma_0701_v2-v3-7-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
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
v3: adjust pdma0 position, ordering by name alphabetic
v2: added pdma0 enablement on Milkv Jupiter
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..310dbd42d99f2ac150356c2128a6e16d1723d19f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,10 @@ &emmc {
 	status = "okay";
 };
 
+&pdma0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4483192141049caa201c093fb206b6134a064f42..15b814aabe10c0a21ece9f0d42264c775b505bb5 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -20,6 +20,10 @@ chosen {
 	};
 };
 
+&pdma0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;

-- 
2.43.0

