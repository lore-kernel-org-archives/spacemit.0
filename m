Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55BB448BBE;
	Wed, 29 Jul 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785337689; cv=none; b=axJloA4SOE1KUTOvRO4p5v4IZvoa9m14ibIqy9+c64j592HvrOpN4TBVwh3X4KJW6hIOse22gczy2Y2OvnFkLH0DiIkoyev/uJePfy8tjFJ/IAcs8jzprsoMu2VX1lk+ZMSiHMpKnYOSkl0tcGBDwe70IiLiy4dLK94J60ozs+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785337689; c=relaxed/simple;
	bh=F/pVqy1j4gJtWC2QnlSpOQ1sc0J7WeABy8WJTZp/4rU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R2X0RFvX29gxs3L7xlHY8f4DB7q0b3ViM7kAVLLXdTQ6xv/KMo4TjW0a7AP+NOrgH1d4j/9ygoOdPC2mYGODVZp6a9ZJa7KbHJvHNS3pqxDhlr198Zvc1mPb+DIhRNdKbJyFCq+BmunS0BED7Ar+2/Ay8IBFN6K4+zvE/JOiUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=yZZeeyTT; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="yZZeeyTT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=/mUnazbboWkLqdv3LvZi2qvz+fGeF1rBdtXR4iXRUGk=; b=yZZeeyTTiM1cTtjjn0q/DfCnPg
	QTbWvuE5tmRrrY2sT+Ca0VZ6PH41nsub2Cen/8hg8eM6bZ978X8RZxIPb0OZe0GaeLNPiNGh5s3jX
	xgM6KfuBcfj2wmtb2xb+cSn2vnfxvpex+F8zBzq75OP6tMiW9VpiOYGfvtUC+Su8FJpujhq7h5FiX
	Ck1hU4sH2Kt40ZmC5zLmCJaqigofYHyOhGh133N6uZ5prTAmsotjq+cyL+KiQkBWGbdpeZenzmsyc
	lkL5eav3UFsPtVUa4JD3lTouT9LJtfJe4BFB6lV2FPye69F+bG+3cXoz/IOMFpb4aV0Tetbc4g5Lj
	5T64du+A==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp5t6-00000002eDD-0cGW;
	Wed, 29 Jul 2026 17:08:04 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 6/6] riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage
Date: Wed, 29 Jul 2026 17:02:23 +0200
Message-ID: <20260729150722.1598630-7-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729150722.1598630-1-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Banana Pi BPI-CM6 module, the buck1 and buck2 voltage regulators,
which supply the CPU core voltage, are configured with a maximum output
voltage of 3.45V, while the highest operating point requires only
1.050V. This means that a kernel bug, OPP misconfiguration, or
privileged userspace could request a voltage above the safe operating
limit, causing possible permanent CPU damage.

Set the maximum regulator voltage to 1.050V instead.

Fixes: 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board")
Link: https://sashiko.dev/#/message/20260728211020.1248676-2-aurelien%40aurel32.net
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index bf502c87040a3..81c40df2a3663 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
@@ -114,14 +114,14 @@ pmic@41 {
 		regulators {
 			buck1 {
 				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3450000>;
+				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
 				regulator-always-on;
 			};
 
 			buck2 {
 				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3450000>;
+				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
 				regulator-always-on;
 			};
-- 
2.53.0

