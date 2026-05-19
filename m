Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0432DB788;
	Tue, 19 May 2026 04:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164119; cv=none; b=h1t33sX+wkpVcEYP1sYp2BHHHkRFIZp170gcNnVH/PYkXrdEziKWn23e1w/FVoMGVmKF6owY7ERoOyn1i4S19AcOrhxd2TsNG3LkZ6/oojmYbQf+67+B5iNmQiBgzxQwnohj4XGbfyXbxeV/XpNvSvhP0cIkXw+yX/3e/xv/bKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164119; c=relaxed/simple;
	bh=asI8ZbDIJHUG5wKZDIpeF1hkiDkz88ritF48j7lXBJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZ6JN2rhCUZC/m2Nw6BZOsKATsKwU5ojKg+Wz/gfo/GW5bZEr/UrpYijLMW/LanloMfKUvSh9bU1Kee05FXg0IKhTitVPd0g4MIVtvCh2tNI4bs+LKP5KScuSR9X2wCC1YOCgdB/a+Ji1x5E19x6YTNSeX4KUVGi+0FjRjv3yp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=uBTcsGjQ; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="uBTcsGjQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mSw2a+RDrVOcV8ZSoq/p8SdqL+RrV1G3jvfZ9SHsGmw=; b=uBTcsGjQWTryN5hW5QQx9lIae3
	5HgW4XWxajw8+zGNsQ8U8IRDrPF4eoX9TecZO8udDoDJBj9c+NiekFZ+VQAoCzqA7A3N0TbmmSEq3
	hUf9RptC/tapKqdf1SAq8W3OWL761YmXvKcVlqWRhBahn0A0OvvkWp4+PlDV65ryWa+W13kTCViN3
	nzs3vNmVZQqqi1aj+RC5P0hlNjLA6W14Dre9JD/K92eEXXVCaluVI8OBkqBmHMbHWQyBbXprkaadA
	oIyUkF9FcvK2EX9wT3R/CtYu6XZMqoArFXuy7stc6b9P6Q0Ru7eysr8EuuFbFosXjTA1vgowR27c/
	nzJQC90w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wPBrH-000000032ll-3qar;
	Tue, 19 May 2026 06:15:07 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 3/5] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
Date: Tue, 19 May 2026 06:12:37 +0200
Message-ID: <20260519041458.3287843-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519041458.3287843-1-aurelien@aurel32.net>
References: <20260519041458.3287843-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Jupiter board has a connector for an eMMC module. Add an
entry for it in the device tree and alias it mmc0.

Mark the device as non-removable as eMMC modules have no CD pin and are
not supposed to be inserted or removed while the system is running. On
systems without an eMMC module installed, the kernel emits the following
informational message during boot:

mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
mmc0: Failed to initialize a non-removable card

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

v2: Mark the eMMC as non-removable

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 450d28e438293..eb53198b95061 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -17,6 +17,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		mmc0 = &emmc;
 		serial0 = &uart0;
 	};
 
@@ -138,6 +139,16 @@ &cpu_7 {
 	cpu-supply = <&buck1_3v45>;
 };
 
+&emmc {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
-- 
2.53.0

