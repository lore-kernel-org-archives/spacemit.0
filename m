Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729430E84E
	for <spacemit@lists.linux.dev>; Sun,  7 Jun 2026 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780854237; cv=none; b=qyZtKrR7840BJZuu3JTdOQDGVtsok7anq7smZHNAbIykRAUW4rHhtnfPy4SPZylj9CFMdup1mDolbTfDXeINPEKoBGlw2Qgcte9ffMQJdhyPXAgEQmP7QsJLSNYQo8Nr2Sg79KszaV9OGOeJJcVrTRN1uI/cjk2UAZOriy5Qleo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780854237; c=relaxed/simple;
	bh=Q0lqw13/3gF4uns/WKal2h1G/je064L1lnG61X5XfIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WX43GfSQYU6M30zTtHICykcfRtB6fx7pfQd4zvY+FyGVyOE9SkFONW1j31eCgMwQejexQQufZtvO2D1TL/HNTG5SVOX8liJM9tuWAxeXSw0kVyYJGV9QM9R8lSq8vj/CrrtlCWbTL509a6QAhPEmkh5C95WxnObB65FF5IDgXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6xlbspf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6xlbspf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf2247e38eso37048015ad.3
        for <spacemit@lists.linux.dev>; Sun, 07 Jun 2026 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780854236; x=1781459036; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51hCQtNZoxXJgbeY5Zuo3sa2yEFucyY7phuZ1UaRfZ4=;
        b=i6xlbspf8oKBC3YKw7ReUFWH10cHB8Tt20Jyrb4pOB69W9lj+Ky4nA3U8LErW7eSe2
         W1fRc7i3L7puT2eNtx7HMzKv8xk2v3cwnPZ9vuyMeNZLk1b+gEnFdmGw2w4/z0f1F74q
         PKPWiLw/nMfN0LMLXL/6yEN3Opc5gFv+gslHQs8cCw8NU6YAyPGlUKo2A5yVVYjA8e7N
         r7ukqWL1O82mVDY4ZHUW7/bei6bKLhc5t1qH/vsi9NkFM8Q7PS4zlN+qhCtgzHQs5TvY
         5M+XOm6sWoenuO/BZJfhELMZEqulyBdojAW9OWIDyUOdoeYlFTqaH2ksqIlVPdEVCNYj
         kM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780854236; x=1781459036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51hCQtNZoxXJgbeY5Zuo3sa2yEFucyY7phuZ1UaRfZ4=;
        b=SMAPswnNi8XWG/eVc/lECqUevZEZFvCm2o2LuuTYNg3Kc/gfWXqC5IDqdqk1Qsbahm
         eZ1shc0WeXyxt0vh4hCf435ms1xrX0xANxwpfDWSJiFCaqP6B4PrwqhhroWV0JQ2eMK2
         yzWN2Mzju3BdeSBAcEttqRVrlr5Jg2lJ8ULAi7NDSu8d0n/QSE/dVkDW+6MNq0Cht4DX
         7Gnzz6ujGaiQNLpQbD9sdcYwmWC9sMDtrINQxJH5mOi13goKMz/Jspj5zWp7mp3iOWWo
         QfTDZ4scQNSuS+mo6BcbEPBu7TwTEch0+r5FkLeYWpz+m6mE8awFhboWfiXQMbMg2aii
         /bgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8i5gRI0ddO7eufn+3hRRgiKVebFrjDpAFXEr7r422x5B4+RR0HatPdk17iidgI+6ZH7YgeIqorTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIK5DrhVL66oSdJl0tTuXs5t03r5qydsteUXItI04loth9H8i2
	H9C9ZUSj6TAzyaqP9lX0DWK8FmJ4lsGW8IZMjPJ7bUYtGUvkcCMzDwHu
X-Gm-Gg: Acq92OG1ur7QhlFlVzFy0BApFcekHs6C6SrgsNfUY9lH+32OEttrCE8jvZLts/K9ySD
	6Z4/03k3ZAUa9QRyeAg/8VAItG84VOBB2wASPDnmrXxq3RWvn5eTY2muX6+/lRewp+gwbmLwLJY
	9oN4GkC14Ig3fA7LEj8MYoJmCKvsnv0V3RMhW2h/uo3wb5wob5Z5Pw4qES1mlO/BrfINN6hPuI6
	EacXn/n2nxVE0kTyiTD84VyqqSfU9olF5kGnC1uGHdrI/B+/fSy1SSuyFQtf+OfIq24rcSHkT+z
	sz2QYqtz9kl6weihJjaPpkHlU1XZaBMqts7/V1klbiWjFvwcL4FiZTwsG3W4b4aLHFIqiLotkoK
	HKjAJmN7pDbIckkS7Z9saLwbnX8fSR8u05iggL7baz36jbwgBoSaCroCz3Gbi+7f2fzTXOsOKcU
	UBBg3FEt7kQdKhnO4zSOw=
X-Received: by 2002:a17:903:291:b0:2c0:c940:dc32 with SMTP id d9443c01a7336-2c1e821dde8mr144525455ad.16.1780854235665;
        Sun, 07 Jun 2026 10:43:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ab01sm149171185ad.71.2026.06.07.10.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:43:55 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Sun, 07 Jun 2026 13:41:31 -0400
Subject: [PATCH 2/2] riscv: dts: spacemit: Use symbolic PDMA request
 numbers on K1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-b4-k1-pdma-req-macros-v1-2-5b2a3955007c@gmail.com>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
In-Reply-To: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=Q0lqw13/3gF4uns/WKal2h1G/je064L1lnG61X5XfIc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhizVtWev3/p2qE70xoZFWnK+a9Nkv64uWXbxuO0Xs59CM
 17P77Pe0VHKwiDGxSArpshy+GhL9tZXPtG+zzl/wMxhZQIZwsDFKQATOanD8E/llLyc8+xv4ap7
 lqx+WP1YXLL/+rrE2w1Hn+2+XBGgkOXL8E+5QpKjef/Eml8TXLN3fjjz6l3ghYft2oXfXErfnNX
 csoAJAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The K1 SPI3 node's "dmas" property hard-codes its PDMA request numbers.
Include <dt-bindings/dma/spacemit,k1-pdma.h> and use the K1_PDMA_SPI3_RX/TX
macros instead, for better code readability and easy for future
maintenance.

No functional change.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
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

