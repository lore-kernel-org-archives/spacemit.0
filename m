Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592800;
	b=dmUcGp/A6TUPaQ2lMu3eTw18fC6ZyTtWP0fgdTuGC32VGVSM81bV5d2DuE7oeeLRB7yU
	 sUsuIbI8TD8jKmEkF/LGUpiw+QR1w0pmqreuMNAY05DeOX6WP/wzb5hVbYhhF46KWdHTX
	 3Xwr79PaQZUKm0t32IPHUO6P6nkYLvkV31+6ncPf8YupJtKZ8n/wGZMdXPStE8v/MjCEm
	 AsjuZZ5YZLtCPPbnpSjX/3XZmGl/Q01VwLxLJdQjlR1XCoI8SbuE/0TTU0TdtSTcVsXl/
	 6AdeeLJPVJ/QGELPWpfLujqR5ICjtADDCCjG8JM0n7s1KmlAfzOVJ5LdELFXRnSZ3IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592800;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2DcaFXD0125nWcxTRBCp0tsdK90suKgYtEdqH6E3k1I=;
	b=FuU+pDDVGFadNAO2cQX2jpWPLNaIwutlCO6+U5eAsH+R4Zu6QPt1hjVSQTQ9vxveEP29
	 FG8oNzlS3gTFxW+UxhzWbOld9RMTuUIoOPDoFj9xDpZM9JHk8hw134ii//3IZvIsaTTqD
	 iNNtyBSeufMilqEn+h4Xt5lh881SmeBhXv6lKZEsAuigjm6Eb/9yctFxtyPuyz5VvieMo
	 i0RZJfZc1dhM4OSHVPpVVvglLrKX8XJWfx8/eSVX4dOhTpnhFptcOuRzTICeYHu96SryD
	 u7v2HVcMtaxGMKdX3+mQcmnKpsna/HkS0MbWBCXyh8hNGEqd/+P9juARxZql9ApuqqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxQ0I+1w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53FE606A68E;
	Wed, 25 Nov 2026 07:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxQ0I+1w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CFC1F00A00;
	Wed, 25 Nov 2026 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592800;
	bh=2DcaFXD0125nWcxTRBCp0tsdK90suKgYtEdqH6E3k1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dxQ0I+1wyBYpeuu5wItqXDl0YeN85hd2y+M4I1d1i8LCxA65e4IbcALyqwp4oc2EK
	 /JYN2yvex9j+1VYcnf6dBUuGkDqoIPkoD76b1k912CG3JNaQnVq/IWLEoh6wCjEcUB
	 sT5eM2kOLTmWm4aB60ED/UIk686OCM7TaV8R3W2/K4i7nSg68G2VziXC3qtlF1mYs+
	 09qmwdNRqW+bRKr6MyWpWKAKaMb/cWN3qLUw9YofKNhwOXIzk/o+Z1EelI40fJRzI5
	 tGwgN70YFjZyX9CeAtXfHUyDXB+21WQYhQDyfRIP1AKQNMOK+pIdk6sl7CNQSnOt36
	 vW5zHmrlSy2Eg==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 07:46:14 +0000
Subject: [PATCH 1/4] riscv: dts: spacemit: k3: Rename PMIC node
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
Message-Id: <20261125-09-k3-dt-minor-misc-v1-1-dd887a8eb326@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=685; i=dlan@kernel.org;
 h=from:subject:message-id; bh=MM7auyW6m3xTfeJCLq8URarLNjoz56AH4mXZ1+VDyzM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJLSJbFQuRW46QpH4a7S6tvP6mvxRWYlljGk
 A1vqms0bfWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSSxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0UCw//akI7eNfI2+KZ0AJf5C01IhO0AXACxpIX4dvH54IwsIeaSQIyFbKs8
 eQ83LbCCgdP8XWmdR8fm4xEg+ujlzIx/ZFweEadtpyt/sG07wBD9oX1htEXJp4apQqTI2mE+Y1h
 mGCuqa7/hZOXHOoRXET3J3qXuIFxkAfX08u7M99Q6tFGkuhVVqj0ZvDiOpGer0IgTf1XkidfPFK
 Zcuc6gkTk2NXwdqzaK14fFNEBlVdI4LcNWLAIviv+XZFJy6cP3ZhQu5bR/xqEFTxzrebqYDsZC3
 LLAKzEq+mfznnF/TOqAx09yj0scEsasjj03LQNqO8SUPquJrn72gGEkkDG+LW23tow+2AzfT3g8
 HpkgBKM8C3BWqs5T+xaArQpbSuB6XyU1B2cIN6CYsv9lw7Bge3vsnQmXPnOfO1RX4urIlLGoJG0
 GcngL4UuXHAuL1OK1yY0cgF+xDOUrUOOMDQvDyX6vmHSmZKhtchO61grLvZFEHhE+eSRU7/KE3W
 /Hr0g5R869UwU4syAkkZ5jYzyotZICC9FuMBjcNLVZW5lq/XVEoCN0XGt/QGgzMF7KAdecQFIst
 oTaocXlyGj/u7t7wO2s/CqzJ3r4AT3qnnsMoiX636DRoIzmdj9dSqe2bGm0VWviXYLdYc7sGRK5
 oY/k1ov//91UdCja7lvgTqXoRmeLOQ=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Replace to a more descriptive name which follow Device Tree docs.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 8d1cd468cf8c..a4afe24130ae 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -100,7 +100,7 @@ &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
 
-	p1@41 {
+	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.56.0

