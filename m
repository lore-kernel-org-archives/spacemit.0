Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823E021ABC6
	for <spacemit@lists.linux.dev>; Tue,  6 May 2025 21:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565614; cv=none; b=kuMvuSCVV0HEqUKr1SMKcfrTw7WyGIJPwUQRMP+qS4vofOeaySevR5PwRcn1RFIXuw9CwjIP4mgsmME+ku+ne70WLaKRCsYk+01Vr8TUB+FEavjacGY6X11xdfYIuShTPdNtsWrf9lsr4f9S3/w9Aj5Ad6lxvsV2szSqN2heZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565614; c=relaxed/simple;
	bh=o+DTlUShzMqTWdpVptHXPZF7T6Hpe95l3FZm/2enEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzrNZ0SEwFJ3F/wTfYrPUQtmyssp49PRYDHBkeB+ho8szrd65N6qYL8TEwZBM1IlQnEjkHhFw6AIHmgQxE2MJiJMoIqBkQz/iEFL+1rqZdHzL6iX3TGqPYe9Xhv/iGhEv1FuhH0HeWL4GCD/P4vv1oE+b5THM4pMbMcGIhCzgww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=e3dte/fb; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="e3dte/fb"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85e15dc801aso560380139f.2
        for <spacemit@lists.linux.dev>; Tue, 06 May 2025 14:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565611; x=1747170411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=e3dte/fbUEMnT6XpnkUElrzEnYx/eF5fZW253wCl27Z7/5iIztQKIUYZjIAxbt0fgt
         lLl+p2WxiXGXcXpNEnRXng/jVXUNLTyw5zt9JubPhPo7pTwO4OACaTig+OGm6unDlUqM
         RNlDJ0e+02lRxVBXCvLFeXfAUyeq+Fq/3vdHAJv6ZV7liTUN3UKevZCbxc9/zjgTBy1r
         RRl1wsKAdXP7gAebgF8FxnDs+G8dRQhdc3RPV+tx7eWupLfxOaMGVuxu7mlNhmNnWL43
         95ymYHDZZFcWKgBVurkneNjiCnfFLnEK7u88RVORyZKoVgZy7CoehOjeHI30COml483i
         p1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565611; x=1747170411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=gSedvpgJAQzT7n52gKUNrdc334KDWD9HjDfYfzdpwlxnN0b2hs8INArjx9xnsDklyS
         uQWGefIU1/KUzoVlEC+ovx5IaqnROD8AMJyxhgKZy9UzgYzwKPS5RsHn0On88NoeE9nD
         0FK4ZsSKZADT0F3VHAVOzs3Crs5RXvDZdOqcwa2eNHgu4kF7toPSoDrJz//YWWy5Ea3H
         7U0jrbaynb0953XNRiayMVu//AjC6LxjmYa8Ckxvpt9D+g8mV2Smluc3dBaqhgER+K41
         sEUHQrOuJljT83I8D6U0vAx5Sq5sQxf35LVov8uh6bl4fDJ7ElRNLEbJENK6CBuUeHMc
         1t5w==
X-Forwarded-Encrypted: i=1; AJvYcCWbQT2uHO4xD9aA4OX5ookLw59ciHwezx/ySBun6OBLU9XjIUVZkmNqaupxCIiGLXEMuEoz5gZv5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyisHQ4rEc/FE00Vxf5JudfEgl2SFtfOAbmj1nwyX3kS/J2nEXO
	OLOGycVL3rTSlgj8cLwHnjfO3QwyvvPULCBwa83MaEJcxaOnDDQAOgTi12Avrp8=
X-Gm-Gg: ASbGnct0fF0tYl5h/iKV9tvRgyLnNsdKg+jQBvSKDXoSqQ9GcG8DNlMZFxfoYiwA3AL
	WSph2CCk64Xmty4RcxoU1mRuu9VOJK/wIIPbNQNnl8RkRpyV1iV8dNW3sRH97p4saCVaw3ts7Ee
	ZAMlAaRXRlpKPWer0J6AdbM0ellYZ6VPlmEGaKgyCv9wD/GrQ29Uq6R8xlh85VALuzstn7CCz1W
	S1YHCjzKU859k4IpNVlekT2hWlt1Jmbz6OnK3OOczwZ1k80BB3Vg6zi5NFQM2p1sIxbflooYvlB
	JvXtnHHqkX+UPd+etkmwtr05dRjdHsW3cLXnfLcApL71g1LGzjHJKvEBk335oWcb5jMihLlSfeT
	xw3QxRDIVNYbK2Q==
X-Google-Smtp-Source: AGHT+IEul28rdtLnf24eQSg9o53hrAPhvZHN/Ndz1HzML1us6xJoFlvoRMcUFOXYOR8J/ANloTh/Jg==
X-Received: by 2002:a05:6602:1350:b0:85d:f316:fabc with SMTP id ca18e2360f4ac-8674731bb70mr129539539f.8.1746565611497;
        Tue, 06 May 2025 14:06:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:51 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Tue,  6 May 2025 16:06:37 -0500
Message-ID: <20250506210638.2800228-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 6eec6328c26fe..f4afb35dc6bc9 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

