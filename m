Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1910A1514E4
	for <spacemit@lists.linux.dev>; Fri, 10 Oct 2025 01:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760061527; cv=none; b=cjeEHTBdVMjCddwdWRsBnPYVZDEkkboJdy+49jD2eqCUji4KYZeHbDuA6E9dILuYpQLJ6WD7DtvAXvOZqxndWV0/phpQoNgxbVtMImhj0AENEF0yvZuzjGyheBu8+Hq7rKyJ6B42Mv98x3uUYjx3S6cptsmqpYF5wuaOZVHm6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760061527; c=relaxed/simple;
	bh=8fVMPi0D436bKk5I12JlAgG0mrDgpoHjEOC1EVXL3+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QW2LuXq2R3XRua5nc/C6BG8xEot7wLkXYu2ofvodNrcLMBXfMcafeqwePQg5bfz/psbp2kr00kidBZzRwXmjWWOPqDlJ4mbT5109J85OYJOs6UxzmDw/4UDtO5QcvrcCO6Udic95g5pKlUaedKG14dAjrBTHP8G6GNwC5KQa+E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=s8+TR4zl; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="s8+TR4zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760061427;
	bh=LW8SLJdqAoSDw7GW9cUUMcMal45y7bSOQHFDO9blFuI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=s8+TR4zlBe6b/UiWtfelNUE0Ebn/cZN3Ll3xD76JxJn9Dz/lEfzW47wprRe3oQsUw
	 OkOa1rSgfz/gyN5Hzarqf8oPYI+CbmpbLeGniD7+Bi4cnN2rydhW7csfwFwxGW6vz9
	 +v/GrfoYRSpx0gFf8LAD9K+XwJxTzDoyDQXXt7+Y=
X-QQ-mid: esmtpsz21t1760061419te84f3ea8
X-QQ-Originating-IP: ZWQ1xL+DZDYV8pAS//7JgtDaaEfZoNg0a5O0pI42V2k=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 09:56:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10941913832204491341
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 10 Oct 2025 09:56:34 +0800
Subject: [PATCH v2 5/5] riscv: dts: spacemit: add Ethernet support for
 MusePi Pro
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
In-Reply-To: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760061399; l=1192;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=8fVMPi0D436bKk5I12JlAgG0mrDgpoHjEOC1EVXL3+k=;
 b=9hQyo3rM7L6zXB5hetSkNx3wZrbLr3AeYBFyQtOSXpyVPaDQYrpKIHQ51TIISBfPsYlbPWxKa
 n5MuwHxuWS0BFH+9k+uCP3vgUNvyWCpw2RZTlGE8n7BP943ZTCfvDUc
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OKyB8qZPGK+t65CNnb5elH8DPN+7gPefgtESIxDtn72Ge5K3P7dpBMTy
	Qhvg27TW+XRnCzIt9cH32ziw4BdztcxB/jJGiN2xdv2dw85z92JFvqElXGpC74D94faWDQb
	G6gKgsLDrde4OkaZ7Y2s5yCMmYRyGTON9S32tyANxK2pf6a7LAz4SohTFkoy/Be+IGUGbax
	LQbxBaKI3ZbgJN8hZjBqglAIQh4x6PfjTpF9kWRJ1ed+QEIvSEMKCHqlr58wU1dPzl9kcd0
	IVEvGMGdc1kWlZmLQbVnbVASrOjx/rj7IQq1JrEjOQYgsgS5jj0YkUzHTNnOeziMzqNo97o
	hMf2+2Bkc0xsVOgJ6L4gteVfCAFFkVkg1JeTAWu9kgC+Fzurj1zorjshCivaJUe1DvAVWRr
	IfoC41I2CWPZVyxlryIc80wTvP2Umyl+hGuvIdh0xzi3m66h/OGPGn3ANZ6VSI4ObuHHffX
	fdT2ipit3Dz3oq8+6vkvFHZXeGTzb+FIKtUjkppMWTBiLKAS6zYKsTn7tc4r0bt5Tp11ugF
	8FhMRhMi75vdv2miTkwS7BDr5I/g4Jit0VBwdE5N/zdYTZXQKbI5ZOhTxsOACoAhbH0s+k7
	uRF8by6Fd9DLufFg7QonZ9EKYXSxZKircDFRrXu/CptrYPtbi9dlM+LTnZngpwWYkQ5QkmU
	8Rc7da2VUuIKb7CeKz9lAA6ayb8FIM2BZ5zm0MBYxJ2qA4+yfDZI7pcLYHxDH+LZ0jPIdrb
	xrSTBAMpNF2jg9wOs7J0MDfNLHVDaE1aLWNoIDcShvocE7uBDm4LCzgQ5dI+XPjiECIdRP5
	GflA3mZQxctgnioQHe7lB7w+lM60rfydeazxD8SrQa8QMsvVhM3NV8ub4xUHB27JnpktQkq
	GK+RYT5bAIk4dAplTYfEW6OVP9tjT8sWKS4vYlxAivZ/7p3iM4ozOnK9/UNww/mf1Wpj5EV
	2Kbvq7YLdPlL3uBonNGZvX9bte582Y1s5cIhclqixekgwYx3QmXgCUBpehKIZOkvgdvAxRc
	pk0tmI7PQyoHIsWH5mJQTRmM5Lgj0jMxokL4X02IdplxxcDckxhM3lICYOfVn6psfuIOHK1
	vHeUUn7Ol0yI68fInag2DyITl2LNBRZkkoBhRz+PQZTgWxpKz+/bOGqbAaquB+4+UentpyS
	lGjwc7uLNkxQByE=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

MusePi Pro features a single RGMII Ethernet port with
PHY reset controlled by GPIO.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 89a35914710bfd15c6ad27cd8d0de7ccf62e2309..e9a53dc7a417117c82f3e467677290bdaeffc845 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -47,6 +47,29 @@ &pdma {
 	status = "okay";
 };
 
+&eth0 {
+	phy-handle = <&rgmii0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&gmac0_cfg>;
+	pinctrl-names = "default";
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii0: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";

-- 
2.51.0


