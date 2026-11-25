Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592808;
	b=MaE8sy+e8uFaiWfuxBDhC7m5Ig0aixePxSH7HBmzclzx9mAIHQjwLEGZZCVQ7Lo+gvhL
	 CWdzWSOnq7el6anESYtfNAhFTYgfaSC1K5+vsxkRh+Ppw23an/dDnT5fnq5wN0F39QaYE
	 FMBsA+12LGQvkr2ZlXaOBTlzcNAIzFlB30FvuO2xzEtPC+KczqKWivCW1N2fJ8jt1kSM9
	 jlHCWQ49/0Hhp1iYMwqo1se1Xad6luNBrsfO7uxOwCpLnrxgOLwnUxdbMoQrUI0ym38AQ
	 oV2+2VztDIQe+YQlucK+VWPuMpn9B0sbq73hOopqdnRFQAvIQNZWdvG9fHf0UTPt3rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592808;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=M/Yg0u7/6WPlFEfzCatSVjj5BVXg6/i3iWEm4yi+0oM=;
	b=nvnbG2qs17aFuK1B74sxcHR9YbDROOBgCNJGq6/WFGSKXscx/mqQNRHATWpR4TsE6Tkr
	 uXuGbVxFVrkL1lGIH41iyivr+ZMCHkvbyG9by8YBCOpDTOjJqOZm8EhKVAsZa+hKMflh1
	 kZFKtItbvd/ZalTI90uaLYLfO+FOPRFfYkyltBh1lbrL7Py+AnX8GJaE9WRVffcb6H+lh
	 e4QiiihbGYtdB2LfwUjhJ1WNxp+Jq1P4PqLukrW4wzSUhcRjivzEI0JVBhC2CK3NeFU6Y
	 0T3oHQLxayoozIJEfQqF6JyRum9BqOAZwJH39rQ2O61vy7g2OrPDsvPG+X7bRGwcIrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oa4E+lK4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC741606A333;
	Wed, 25 Nov 2026 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oa4E+lK4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116A41F000E6;
	Wed, 25 Nov 2026 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592808;
	bh=M/Yg0u7/6WPlFEfzCatSVjj5BVXg6/i3iWEm4yi+0oM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Oa4E+lK4IVjeiDO97UoT9fbsFb7uDbTc17IM6oSoBwecZ6RxsqHq4BE87llULhfeV
	 mR321tGaNlcd0LiZXt2pV6rPgDBkggx1W/yidGlD0McbNSK87gZKjpQlnunVp45Ff3
	 V0Mdu/BqyasqSttZEq4oloXGVRExtMuyZV1oPoSD0IA+IDabB8ZSDQN+bLNy3ZgPrB
	 yXn6VS9fRp2xQaSEVoqbhtI1rA2wUoQn/TbxzKf0AxTIwDZ9txMx6W1okmQuG8XERI
	 B5AETfVAOgzwOUQQ89fIk+G0L/NQo+JirvOW60q+J4ife9kMn1vYPSCbRhuYhn8QrA
	 0ik3PuEk8c60g==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 07:46:16 +0000
Subject: [PATCH 3/4] riscv: dts: spacemit: k3: Add alias for MicroSD Card
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
Message-Id: <20261125-09-k3-dt-minor-misc-v1-3-dd887a8eb326@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=593; i=dlan@kernel.org;
 h=from:subject:message-id; bh=DOKR0EO79yhDzRsaEFOVBxWUE/Kc126K90RsB/fWYZg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJRv/+qf9xm6aU3cM30hLpZ06hvKl8hD+N6x
 ErRQCiitWqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSURsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0mFw/+PbGaCMMJASnujCQaZaIxUjBC/SQl4MAgb4F2ICMrBUV8USvD+GdIQ
 E7yiiJ/vqPIa+d2zDTjiDLSMsYu/bSItbRrURUAT6ObUagOrp/V2fCmIHtGckWQp4sAM6KHNFxg
 5c+45/mSSeOuPw3ljp6V/+u9Smmg3Hfp+U/SrjlP0sQZ3hdegEHyye+hekt5V/AYxCE3JbDOOrG
 vukT+HCD/E7RSPRGzPRXRhBpYMKbdYz5pKbKEY3zJm7JqGPJ3+qRgi0wMRRn5a8TMFMY6fOHGK1
 MN3yVpEfD6GCLw2YTpJxGtjrRfEykMz/kFOL1ZhtNlX1C1IL65Pt+Yy4yo3tz5sFY09KA9p1uZv
 q/nZKkbfawMxTu4Fgrkygxm3WOHzpxvSdlHYiL30ys1QDFPU92xR6kzr+00nQl39krJq5O8v2kR
 kbKC8jABcH6KuYwnUjOU9H4uCrVuxT6gky7ac2c33ltQqrCOteuOV0VwLHGvwvkRBGlsABwlPq6
 HiDuvT2TbVCM67ZfYVjVajpA4H9ItWjGsacJv0IEYB5Ofs2qKf7Mjgz2VGav58e7NjKukJQ77de
 2pmnby2XQbTCJ85cG/C/tIWB4T1LvZ3k/OjqPess6hrz4B2BI+1/zE/hc5MYNybgKsKvtgiWene
 41wM4EahdamuzuqOxsyjk48KL6MH14=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add an alias to the MicroSD Card for CoM260-IFX board.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 38809d01df82..c5c5e6d44918 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -14,6 +14,7 @@ / {
 	aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth1;
+		mmc0 = &sdhci0;
 	};
 
 	chosen {

-- 
2.56.0

