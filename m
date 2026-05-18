Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0C83822BE;
	Mon, 18 May 2026 20:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137905; cv=none; b=kN2fDSgThgAlOwKUnI4tEL2UyJcNWAXaQKLcuDKg7CS1Ur5GT5yrttXVLyWmWdXy1hF82CHtwZ+zqqY7DCS59CAI3zUjNEGqqpcBYOP+5YjW6IiqqVq3Kf/MWLVdy31ei6aErA/TuWiOQtcq8VWNU9tNh1pKhy+2iCCNxtddUzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137905; c=relaxed/simple;
	bh=i8rjaRkxopw8OlF0S2A6bM63Z9+AhhS7gHX5DH8OmKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oh5LWPsxaw7IYubJLZiYS3vCZNSvxq7cWZO/fk6M04xbjdMFEKkCqN2LrWNlvAR6rUzqfjc3Teh8W5dIQqBG9x7PqxkO1hFKl4rgBK/h9+G1uKkgVzjf92PJB9bQbZnP4h/Cv3d6W0YNHmWJx8zbGuMZ72o579J2agAENzyRnJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rU/h+E4d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rU/h+E4d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182E3C2BCC6;
	Mon, 18 May 2026 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779137904;
	bh=i8rjaRkxopw8OlF0S2A6bM63Z9+AhhS7gHX5DH8OmKE=;
	h=From:Date:Subject:To:Cc:From;
	b=rU/h+E4dh0AdXeFgtVktati3S+YTYqhWKFEnvMd+ft72tUvf6BlIgdPpvVa/0Xk9I
	 /CK1OwsLdiXQ5+Lx8pX5qQJ8+jxxhpjrcY+xB0kN4L00v0QNRZhjbxuOXFhhFjzdeY
	 xrM2OUtdQoKml781VKun8tTTl+i8nlZFYcwm0PuAtbAG7iRWXjlKxgoBf3++o2cf7M
	 myFNQOOMwf9ax4WNEK0R3K4Dwxwr6q+y5vpiRLrkMyBvO+i0U4Z5J7oGyyjO9NfHEW
	 a9IwG3ojWkSRMm0+8IMq7EN9NyTJFuY+fDX6pteSKb5Us4V3gs0Nt3oL1xhl/fu8cR
	 6FhjVXw05NNJw==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 18 May 2026 20:58:16 +0000
Subject: [PATCH] dts: riscv: spacemit: k3: Fix I/O power settings
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-07-dts-pinctrl-io-power-v1-1-abe19c14a726@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGd9C2oC/yXMTQ6CMBBA4auQWTtJC6LoVYgL2w46xrTNTP1JC
 He34PJbvDeDkjApnJsZhN6snGKF3TXg79d4I+RQDa1pD6a3A5ojhqKYOfoiT+SEOX1I0LrQdW6
 ifjjtodZZaOLvdh4vf+vLPciXdQfL8gP15NuoewAAAA==
X-Change-ID: 20260518-07-dts-pinctrl-io-power-1bd33bfe5894
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=dlan@kernel.org;
 h=from:subject:message-id; bh=i8rjaRkxopw8OlF0S2A6bM63Z9+AhhS7gHX5DH8OmKE=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqC31qYwQytJjsLBLJBfc0/6szLw4gCToBXYwaW
 g7gbAcDvQWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagt9ahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+01fg/9FSqJUEIvu4++shC1RVOfuefElopiNxTv0NbykiV57GNmsOY4TqNBw
 ju5dnVyCPtcGashsbtiiaK74a3jhccrPbk2hBaR2UmTI1p38UVKLv9pO4PZ3BhcpTjXGRp+CvJH
 C56dJm3NASSBBes/PGH86d/R6KXRD6vgLtpDHoLurHRlk2apgklJYE2VsUT/ovU87w2gVRpalqv
 n0SK1J5pglbY/lGDkZRa5JhehAU9CQwcSzcjvCBGG3cO/WWwd31w/GH7bgROImRmep+G6OA6+vG
 cOeAFheTEmqFaDvJD5JX8AIiAqarf+m87mzocbpByxwGzaSpnzoMZvSsu6zIIhbCEuxCrkJ29e/
 yP3RExGnAjf2vukK7/cj6loKvE7Gw3WKS/GB+ME+DlUJG67bTQRttpyTp6jcIjt+wG7RAZMxRwF
 a9hdRSMEDHWbPgzGdaL8rCp72RjQE08aGgMBIKhIy/NrRZKJZL4IwvtqTVlMfiQ+hS2cXDMWkVJ
 lN4mQWyZnPwdILVfHVovrpBbWMCkFEHk+dKP75LXb23nYBpxQc4IMnUHWCKrlCGlXi7S2xghnoj
 pX9UObDowwa1iPNnE9wgIlGCL98zr14d8cprlY7mdhgVKx8oxS/Kp023bt7sdhWXJuQQVHastAk
 ZsvwsyxhDEi2GV7M4P36PUo0ezBUWE=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

SpacemiT K3 SoC support dual-voltage I/O power domain, while initially
configure to 3.3v, and need to access register from APBC space to switch
to 1.8v domain.

Fix the GMAC0's I/O pins 1.8v switch failure that will result a broken
ethernet driver.

Fixes: d8944577496b ("riscv: dts: spacemit: k3: add pinctrl support")
Reported-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
This issue is reported by Han while booting kernel from UFS storage, and
found the ethernet driver is broken, we can see the message as below:

 [    1.635881] mdio_bus stmmac-0: MDIO device at address 1 is missing.

This problem is caused by GMAC driver that unable to configure I/O power
domain to 1.8v, which leads to the MDIO communication failure.

We didn't find this problem due to using tftp(net) to load kernel images
while bootloader already configured the I/O power.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 815debd16409..2b0bf9cd755b 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -803,6 +803,7 @@ pinctrl: pinctrl@d401e000 {
 			clocks = <&syscon_apbc CLK_APBC_AIB>,
 				 <&syscon_apbc CLK_APBC_AIB_BUS>;
 			clock-names = "func", "bus";
+			spacemit,apbc = <&syscon_apbc>;
 		};
 
 		uart10: serial@d401f000 {

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260518-07-dts-pinctrl-io-power-1bd33bfe5894

Best regards,
--  
Yixun Lan <dlan@kernel.org>

