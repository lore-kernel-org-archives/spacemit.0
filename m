Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93341166A
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 19:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034459; cv=none; b=cgZWYzCjWVUuTdijCjlWq6j9p3glFuUkG5U+duHEYu/I67yWKXfsR1zkRfIT7MoLUw/lL5ESyhfulStsHrEQxzVp7jkcsIdU0797jaEdknHY37GBMNYd4NwyOLNkrgDGB7kq1edGXq7rDQsF78tsm26fX0OQgi2p8ItoLxouCik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034459; c=relaxed/simple;
	bh=H/kR+2HYwlqkml7voLWdHY49vUjyuP/Tsib1MnxQLD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oufA2/gJiZ3y/eF6ubR+0sGBiZq+N2hKD1CS9FjAHfbyfOt4XyLokQxkdQNvilVzW+fxKVVvjvEm1B5XKx+aeJmVjNCZNahHQeLFcryBrNEJpJLDwE4uONQM4SHN/DZZNb0KCkiWppE2Dfhh6q5TCmlTnYSh2K5X4zUXbcDwaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbBclbrD; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbBclbrD"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso2590779a91.2
        for <spacemit@lists.linux.dev>; Tue, 09 Jun 2026 12:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034452; x=1781639252; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpR6igjuZL+55NUetVLOlJ7WyoEDc1JskAO0eU1M5r0=;
        b=BbBclbrD+wN/ueorTdvqiIETJh0kYu+KVZhp8xPaFRTdzUR9+bd/ckZLc+QpwMc6OU
         nHhLG0/qBsOZjx7NzYFmRyN1FxaqRlcxa9h18sQvztGvugGwe61CpjGrtTJXypqYHPfP
         iDKjAZLq4/HRfPlpByrQ7CshhMKK1rCrig3ARXNKx8Wt7uJ+OW68SRPExqW4asfXhHdX
         EqU/1iRPOVARuA/02QN2Rx5BJZdSbgaadLU/0L/0agDiC1HE/b1l/4WPnXj6nHrjbtnt
         OQ0bAfG2VSagL8X7vfhFN4viG6qfkqAPdlE1qvntMjfRkdc4HbsqA7HRy0yActac7mqy
         8aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034452; x=1781639252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MpR6igjuZL+55NUetVLOlJ7WyoEDc1JskAO0eU1M5r0=;
        b=a3F6+jIW/AWp9dijDwGkhSynlpMsMI71CMa9BDV/HZ8rSS54B1Nw1tWcADduDUPFpY
         hiarK2cFTA2ZLJJOlefXf8LsEgsUUMZrekeX6432Oc9X8sjrq8kOVBC0QI/cTVCbdF2r
         N21F5VdlBmE/MoYrD92mWfUxyod6epOJTsuTbUEVR1WD7GgwtiSNFZvXMS4unC18YRgw
         sl41RO2mRkxOY8eROLJV3xdd3Em4+Rcno8c/JESsknGa3SW8OSHDXvEi98FjV/B9YCGE
         sc1HmeTvws+YlQdQTU2lTJFDXd4IEj/G4VBlP+m8uWHkLnAzs5GoEZJemXFIYiqA8fFP
         fpkg==
X-Forwarded-Encrypted: i=1; AFNElJ8E9o1AZ1Upsf0cQeaPt7XzGMs4ZWJxZGIGz9IaSZk6QMeWFc/8/hlqPClC8SxSTWtJNYtV4ZzX/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyW2iycuEn6AmPVs5mpGPHZkB0thrJk4o4DR0MbrCwLPWFk+/pS
	yFx8m6Dv4T1RLLkpwQAu1NKpokt2LgEPham4hgWGrzINoFs7d0hPTOZV
X-Gm-Gg: Acq92OGTiRKzcKhbHvK/j9ccBk5ebUC9PH1TsUg7W2aHKhsnGXWX/z3Mt8vEaI0Fm7j
	REnpWlsuY6iJckVuCyGplTIUZDOIEKHs+S0OS/hfbbLAcmz458Scfm6Rz7SnlYKD8VSqkohXGBA
	1HJ8yIBCOLp8oU94dbzBc2un/T9kkgyH0IadE6FlysEOiJvcBBTYL41B1OPjhzc4qrWHVdWo7O7
	eqDMAfUGQUxqfqxAjnUt5H3gPLGNo8SbyoeAFmkuVWCK7qZaeuI1LNSwix/y0VHqGdT5hDSR5oK
	2I+JZM0yIrQDWB9eySb4urJ7ELswEdedKx6LIqWoPLvoT7XqZeEtwYG7TBvRRifp8FeJJr0c7+I
	+aJ0Gx4VUXH3VyEII0Z8FfMNgnKp0HoggrV4x3R39bz/rE9ikFN9qFE0MUefrJmbs9JgP1lz0Ej
	VER2I+s/D5
X-Received: by 2002:a05:6300:2213:b0:3b4:6026:6c78 with SMTP id adf61e73a8af0-3b4ccd45617mr26253003637.11.1781034452412;
        Tue, 09 Jun 2026 12:47:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19517121a12.14.2026.06.09.12.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:47:32 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Tue, 09 Jun 2026 15:46:39 -0400
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Use symbolic PDMA request
 numbers on K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-k1-pdma-req-macros-v2-2-5d5d7b997b54@gmail.com>
References: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
In-Reply-To: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=H/kR+2HYwlqkml7voLWdHY49vUjyuP/Tsib1MnxQLD4=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiyN3GM9QkaZAY4pz7LmFC1dU6c9iz/tlMZKQ7fXVvMvK
 4nY+yd0lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwER+HmdkOHPhNCfP+fsPPTcn
 1nqfuZncluzK03QtbIry7o75tWsLqxgZztYqCf0tjHyftnB9yeSb33LSxM8wrTAwv3V5m/txgWc
 5/AA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The K1 SPI3 node's "dmas" property hard-codes its PDMA request numbers.
Include <dt-bindings/dma/spacemit,k1-pdma.h> and use the K1_PDMA_SPI3_RX/TX
macros instead, for better code readability and easy for future
maintenance.

No functional change.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
V2: No change.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011fe..c413a64d5560c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/dma/spacemit,k1-pdma.h>
 #include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
@@ -1094,7 +1095,7 @@ spi3: spi@d401c000 {
 				clock-names = "core", "bus";
 				resets = <&syscon_apbc RESET_SSP3>;
 				interrupts = <55>;
-				dmas = <&pdma 20>, <&pdma 19>;
+				dmas = <&pdma K1_PDMA_SPI3_RX>, <&pdma K1_PDMA_SPI3_TX>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};

-- 
2.43.0

