Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A44302CDF
	for <spacemit@lists.linux.dev>; Fri,  7 Nov 2025 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762542976; cv=none; b=ns0hSat88YW4MtyK4UsOp8xOR97lOb15e0Ae6PRTncJAz04BjDBq/+5+wX4SpVgfLOMWVOt+OsaDKScXqqfSjZniB1RX1agD3dOn234tfzg6GoMXqETbPU9qhbgQerGabMmSklMn7BWltjBEZKglZI4Z6xMySWvhSp6stPDXv9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762542976; c=relaxed/simple;
	bh=QBekHRPzqKsUbKsby283fcZkrUPlP9R23yy3sAWgrIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHrff/N7vcBiGMOovCTJEF8AsXPs2/A2ausJdfdTy2eMdRUsTrUB3Enz+O0N0456QJ66Q9hZyrSXDZmnL7Pkw70W64dKUAlleQkLMYxYjorSfbz8PeVnkD3QVXf1mRGqYt8rFQaOUjMwEBuQOYpOWQxggXNhtD+ncFwdW1Dgmfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=IFvK6d1a; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="IFvK6d1a"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-43320988dcfso3948405ab.3
        for <spacemit@lists.linux.dev>; Fri, 07 Nov 2025 11:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762542972; x=1763147772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIkVe+mugmsixDMdOtfVXmcZx3cul0N4BhQxpoGzDAo=;
        b=IFvK6d1agnyA+zhzNVX/U3rW1IP2gJmUhBJo5JaF00ryDGPsJIRafFiaQ5FZaMbmST
         AXrKx0M+aUZY7hAOIRqxN4W2bktAFwaTzTO8RyPSZkohbK6jnY07gPVtpb0KCx57EWBm
         dfZc0AuFEbANFpDAm9U+o76oA+Pu6av+gKwJy0hIAQOZt73r3pENnphU4K+nxWmSRnoR
         sFuRJ2rvNwuQLeIuVH3fsQu0IgMJgpdC98QJxm9gtQbG4CulkfIHZ8C6HRom9esBsOZj
         3siiMk+chsZqcBEKZWYYNjjfIfym8n2dNqNHnKawB2yc1Xwghv4AUZ5ouXUs2JiX3p/N
         StXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762542972; x=1763147772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UIkVe+mugmsixDMdOtfVXmcZx3cul0N4BhQxpoGzDAo=;
        b=lPjHRlRHE8mbBlWQ3JNiRuI2s+AxNya4+0Ooj8zSvIba3nu6GTW04axqDy4eEnlUcY
         22V1akFodwsA1mFRmbw+TX1T3UOuuUFNg9TVQdi51wLWi11rVm7gd2vnH2bnYWydr4eY
         mtwqIYeN6I4XjnotP4A6Xf6/hBu4JnnHEEIlzjy30uAQTUiW3ke6vLGLTVCCfQoJ0HXt
         IhqgGTvomBOuiBxD1Vw8+r05rvgOGEL3QmliL9gxQo28qo3CKaJZxAHySPpx/PhGpWiT
         vxg6hV9OKVQ7TdMzcJdYYRCZGMcnAJ1USJRkn4C4698rDv7RP0Lpe/blcsgUjx5hfN5z
         /jYg==
X-Forwarded-Encrypted: i=1; AJvYcCUbMnHqjMzXEo86LJlvCcN8Xnx/SOLw+XJp9bqK1jMGFs/Zb9bpxftQMWaa9/RU3brf+0OVus721w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVXAJAw/vTGWqiZqdhxKqnohrJsEv+/rrGrTSzW1r9EJqPqN99
	9N18uzxyrT9NGtRZtUf7klwktQhMh1fN97zPDn9uVemkuiyrpYH1wM5iaE9eZXxmPPU=
X-Gm-Gg: ASbGncu0woZzk5vKfx+k27G0yDRWM14K4+bnlFUbyDF/JO/UUV9BQWlbILPCis8qajg
	ULkA2Gsl2xtxCZXLBNouneR+Z0nMNNtZe4zJIU+WsjsxPvdjLvg+S2FcbXl+N8JQmeK31NkfVQ+
	F1dCGbec2LOK1cCHObb+MlOQKbESGMQwbg9tPhwHz14yz4phsXUSlmJwW3OyeRRB+yXdjvLftsB
	Mb/S/ebxqW8E8kuFQ0URyrSnhauixVCqCfoL/5vWALG6xXy6ZxXI9kJjQdlq8ykZceCrrIVqnxs
	E/8N8hH0H8GHhbVETqh3NFBVwbjRweiSVQk18oHh6jydeapNQz/tIpUyGSWSnz6fl/d+xcWVCDX
	a73H60X5It6Cl7sOX+bVyeBWKcUHjLiFguA3+GrKdOUDqvVchGySdibK+evxY1E8HWn3hm75uPL
	6LYKMGK8k+W8A/+EvySITm5IqPXUArIz7OedDfcB2pTrOT/M2wR0rcsQ==
X-Google-Smtp-Source: AGHT+IFlqajTRrH6GkEYkSY6pfJF5GBL4YJImuL4SDohElEvyYDysB5Vc0X5vM04WS5bSAaQD5USYA==
X-Received: by 2002:a05:6e02:3e91:b0:431:d8ce:fa15 with SMTP id e9e14a558f8ab-43367dfa481mr8936525ab.5.1762542972541;
        Fri, 07 Nov 2025 11:16:12 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94888c34c6asm118772939f.10.2025.11.07.11.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:16:12 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] riscv: dts: spacemit: Add a PCIe regulator
Date: Fri,  7 Nov 2025 13:15:55 -0600
Message-ID: <20251107191557.1827677-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251107191557.1827677-1-elder@riscstar.com>
References: <20251107191557.1827677-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a 3.3v fixed voltage regulator to be used by PCIe on the
Banana Pi BPI-F3.  On this platform, this regulator is always on.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..a269c2cca3ac9 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -33,6 +33,14 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_dc_in: dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
-- 
2.48.1

