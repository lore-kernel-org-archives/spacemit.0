Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592814;
	b=l3ne/+eqKYuPpAYykS2Xi6STErol0RgLkkawiXUEkXmyaKeYbUYuZvCEb4DF1ggVFyMB
	 KdGEPybiaw+mkML6vlYcjFjuEeq0hLH8E+8m3xBlHXLLAnuHldFc7LAwrw7wa/ulVUdMG
	 XxCOIlM4UYyAjg1lYXKa4SzKjjiWHmhBAFsI/tBWxUhRbXpPxNNeoOkA5+mpe4vpuJV/u
	 l8BrgflpMAQyB2gxp1R3gIbDq08c2l0gypz9jyq3ewvyz40nO7+rialAZbM+Sa9uiA/De
	 q3rAANpqemPR1PFq2ZB3CZycBWEOnDDO+GS6PRxZUDFznbm1rfGrnp/2UQ814vgd6Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592814;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=40a2SxR2F++aAWEGeCskAj0ReXgihjjN31vR1BVlWBs=;
	b=l8DtRiUxmfhzGqVV1oOKOzoglQfdxB5J0/t4m3CiuruatyHoLEvVUrZT1DBMKCDfdpZd
	 YDour87ZvYwFbi0E+esbmViwOLBp4f+doh3VkNARXoxS28e8E/8Hyw+9Qex9KOpo/FtW2
	 iuXXRCwMCLJ2KzLvlyDtGWpV4Lfi5+NjvdqwXQEazp31fkkdq+j5HWG4++kpNLB+YWpuC
	 rW7qIF7Wz3bsWwEP9n7Rx9naSWUNeiGbqpn7ZbDr4a6KQGa/rEbP2W2mCh8ds0amf9nN3
	 BUN1gERrhW6F45iYCwN1jnM7UVVrtQeoBoqxVFmOsmlya8tjzA3M7gQzk2U3O14kjnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GF+1Udnt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D97606A680;
	Wed, 25 Nov 2026 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GF+1Udnt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910BD1F000C4;
	Wed, 25 Nov 2026 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592814;
	bh=40a2SxR2F++aAWEGeCskAj0ReXgihjjN31vR1BVlWBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GF+1UdntSeWb27lATOJUYK0ZM85tb2IzGIUc7ccDmhKFbXh9Yl7friVx/RE9TRE3e
	 7gRbCNxKOcOlUJIFo7z1C27olhEsNZi5vO7+yE1LX/XiHuDTob27h5n3rbyUBHS78E
	 V+5gfLmdXdcxQnMu15mENMmo8iGpai1RXROtG9mTKd734JolX2Vg06tUS/wt3pKe3m
	 AaQJbdcEAxdWUIszuLFrBavE4mhJu9bKKoV2XuYjUCiZDxnht60Iy4Z7XVODmzf0T8
	 /NUfAg6lEbnCDGIEODMZtWHb+ysu1MhqDDxXSXw1S1GWO86KijpUTDnQBJ/lI+ZSyK
	 FJQsxoMfI9ZMg==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 07:46:17 +0000
Subject: [PATCH 4/4] riscv: dts: spacemit: k3: Set CD pin bias
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-09-k3-dt-minor-misc-v1-4-dd887a8eb326@kernel.org>
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=dlan@kernel.org;
 h=from:subject:message-id; bh=YNc1vItrgHYyzAJZXdA+z/8Pr3LgzudsQKQoxQGoJGI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJUlQ5XNwoXk5k7IVVIa5jI7eZycR9IEOiyi
 8XgfVh/C1GJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+19pg/+LKShy0zh5QYLystrUsbPBbb+zQGtCzzE246Tailkiy8GVhITAb0Mp
 d56vguSjRLlwg4OzyI19a7D7SWv+SKVW3Mcf1Hp90ZlA3s6uLkjSTBIoLDLNZpKZx6yYYTP+DoP
 46MnFNF12ljI7pApVHuF3n4+PnCqMJqpfyh51RyRrlaEOAsODrPLOYzwpZyJwsE/hPav1/0h64C
 ka0a0+MbOdw1w7Nbzp7o55tVbJQB0gbLuyRlva6QpichzKS1gk4lqpaFAQSxjRANk4m1Ew8TFvJ
 f2+6AI3M/+19g8mbrgKBBkPyMObfo8rFtXRlgQtHZFr6gdOJV9lxOmhHhxk9ktcaDeKForS+ywM
 6xEvwM6/1ypa4VgDkbbAArp59Ht9YWJb42PrYc1rIY68XknkOrCYj3RVt6ER4TCGYsig8WfOPi1
 xfOWQ3yz25U9WV5n+0dACHOzuUtRUQJZXBJnoIRj//6vKcIwuqeAzrE3kPxmGnbW68YCnSBWJG8
 6Mqgwqyy4QHC1mfATASLZzPQznZmZD+Hu0ylCQsXMP8tTt5nRnU375gG2ZJoGcc84uJ/10TaOkT
 Pt/ct2a3F774CrXNJSFbEa86qEcrZZhjO0+qy1g7+8sSUsIv4h0ECha+U3Le6zLRD3pf16wgaNo
 22o68gYAMZktPmSvIpGdLqs7z1HTG0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Explicitly configure the bias settings of the CD (Card Detect) pin
for MicroSD card in CoM260-IFX board.

During the GPIO pin request phase, the pinctrl driver disables bias
settings in function spacemit_request_gpio(), this happens to work
in kernel side, but doesn't for U-Boot. Adding a flag to fix this.

Signed-off-by: Yixun Lan <dlan@kernel.org>

---
K3 Use same SD card slot as K1's MusePi-PRO, which needs PULL_UP.
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 65c6f49f8591..598a53461afc 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -240,7 +240,7 @@ &sdhci0 {
 	pinctrl-0 = <&mmc1_cfg>;
 	pinctrl-1 = <&mmc1_uhs_cfg>;
 	bus-width = <4>;
-	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
+	cd-gpios = <&gpio K3_GPIO(4) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
 	no-mmc;
 	no-sdio;
 	disable-wp;

-- 
2.56.0

