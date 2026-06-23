Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ED13A7F79;
	Tue, 23 Jun 2026 20:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247480; cv=none; b=mF6bdRDQe8939D9jF+qL7bmtaj2Uun7G/7u6bcasJRmYC0MVkl162GjLg6N5GnPzm4oCUlgzALlLEah4X5cSqkkS9evM67kSAGWErE+FBWphxdIO1qUevferCqwsSA3t+tmu/puNWXgz71T7Z1OzOLJipKSIfHk3WFC4uQb1mKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247480; c=relaxed/simple;
	bh=mabPQx6kSknZhjD6dDJqcB+ljO2b/0lCnKSeQv5ZNSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NI8AAQqwky6kLMq1vBBIpprQATPeHsYcpKTPPOUqurkPeNVpx8yxg8GVoSg+DMcZ1YO4MFac4KdDZ+4iNn0We0ObCh7HlY9jqGtLP/bi8ZNy/Ax9pHjfAd80d39AXen41s7NctcB4NFRM/fPByZX5/z59Wm7LV5kKVQsw/7jANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=HTQgmKUW; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="HTQgmKUW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=T9glhAXyJEgh7ggtv4/2TwLXLw4Qo9OdjHUvC8keZyA=; b=HTQgmKUWoCxSkHoqk9hwfa27f/
	ba0kVkAENichzxfoJcdjHdf3eAB/pZp9tVM9DaNEujqJ1R4zJaBctkQmDFxGyqrF2G/1ejFE/fwfu
	25x4d7eTbqua57okiBNmOJBEpmFBkrpj+RRn4VBVGsmBoiG51jae4OnDwEkjz3NTbYZKPBvkdJpEO
	m0NBUy5/31bVwsTVqPCgYHJXMtWwEdEJeYN2BhCY3Tsqy8/YCVd++UfvYx0aK/g54/P0JgBSAgj/0
	2uA+e7fKiZSERngdmfOlrqPKL13LFVHyVL77/cb3ibf3nUOU2ju8Xmr81lMU0qc0bmqXsbNJliyy4
	b6QLoq0g==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wc7z3-00000004gOi-2fcA;
	Tue, 23 Jun 2026 22:44:37 +0200
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
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 2/5] riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
Date: Tue, 23 Jun 2026 22:43:46 +0200
Message-ID: <20260623204431.498700-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623204431.498700-1-aurelien@aurel32.net>
References: <20260623204431.498700-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define I2C2 pinctrl properties, and enable it on the K3 Pico-ITX board.
It will be used by the 24c02 eeprom.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 2 files changed, 17 insertions(+)

v2:
 - Rename pinctrl subnode from i2c2-0-pins to i2c2-1-pins
 - Add a missing space after bias-pull-up

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 509cebc0c9568..5fe9041ec5702 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -43,6 +43,12 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_cfg>;
+	status = "okay";
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f37985..50dc124c097f9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,17 @@ gmac1-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c2_1_cfg: i2c2-1-cfg {
+		i2c2-1-pins {
+			pinmux = <K3_PADCONF(46, 5)>,	/* i2c2 scl */
+				 <K3_PADCONF(47, 5)>;	/* i2c2 sda */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c8_cfg: i2c8-cfg {
 		i2c8-pins {
-- 
2.53.0

