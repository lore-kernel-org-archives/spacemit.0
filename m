Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4242049;
	Thu, 12 Feb 2026 01:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860352; cv=none; b=OD+jqy280PVlcetaYL+FGOe/cxo0yXCq9Tt+2XvHhtYmgIAGfl9CSjapgfVTApeLIWVj2IJgIWqfd5o/h5owCtfi3Y80+y9yridjOxru4i6qrCAKqCSvDC0E57zhr0+tiJqY1K0bZoHtGJTPS7EKK7zTrIk5yJRZThURrRLrB3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860352; c=relaxed/simple;
	bh=VquqpyhQ3deWhyTUCGHSr6ncunPr+ICzU4ZIHWgQYwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=joPGha3eR08oYxMaP5Er5Qm8S+fo7O54m6dUUzOyfzqMiqreWez+fXFzMC4sMcFdHEbRbLEZsCWHgSuAu3493P1x8ownYb6bQqWDzsP2UYO01FKV1dzi1URIze2KwRpQxnJguv/InVGQ+6I2crzSJ4PPz9rgeykgM4FSMMO4vtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uK9F4SZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uK9F4SZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BAAC4CEF7;
	Thu, 12 Feb 2026 01:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770860351;
	bh=VquqpyhQ3deWhyTUCGHSr6ncunPr+ICzU4ZIHWgQYwg=;
	h=From:Subject:Date:To:Cc:From;
	b=uK9F4SZzzSpQKeIVDnYVJuKurEkLX9hUsup3ysAgntoPA+Y/VEY0QQDmKFPkUcTIC
	 jHnwoUk2HuACPhO149g5DgLK5QXzu2e76QcmQs/vCVwFUjMNKHHPdNw1VqJ2LEvUP6
	 N3nBZZr/mU+xLUGJMdsrhYmh/cS7VQ/GLtZmXRIT/K15kut07ADcCrIr/rCOy1dEPj
	 cCEgRSW8YnseNYRysMeeNqqXnLg3ckCHKIsNM2yRgIqGRvRyiRWfAesnfJrGbMxtou
	 YKp9MUErv5BOvxEtNBkFkJy9/LlfjrQyWjlBwD9IoPvpOp5hPKOJTp4Rs0X/67AO2q
	 7uv8wf1gmsOug==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/3] phy: spacemit: Add USB2 PHY support for K3 SoC
Date: Thu, 12 Feb 2026 09:38:53 +0800
Message-Id: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC0vjWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMTXUND3Wxj3dLiJCPdgoxK3WQTM2ODJEtLgyTDNCWgpoKi1LTMCrC
 B0bG1tQAhkvsqYAAAAA==
X-Change-ID: 20260124-11-k3-usb2-phy-c4630b990b1f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=842; i=dlan@kernel.org;
 h=from:subject:message-id; bh=VquqpyhQ3deWhyTUCGHSr6ncunPr+ICzU4ZIHWgQYwg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpjS8wp+DyNoUIZxHuDikotY3ugiavkMetpWVa0
 RB4OsKk1hmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaY0vMBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2FwhAAiqE60ONiABOR54DBDtyV3drNY6A/zVY7zaPeWEgM+uSAD9n6EmYdN
 qyZQdPHHmxsKvFzq/xxhWKyUx8QOgeLbiGplsMVTdP9khtzZDztkNlEbc40NAaDx9m4TC4SKfjH
 MK3vBBK9bpDq7bh/GpZCWfztDNDYBC1CGqzA1fT5COJUdWwQ+ma8RMBwix+6whxu+/vz51AVODj
 HzXJkJY/IUA7XJ2Xob6enh93N9UBVX1p6083DcqIa/YrCs71B15F3JL3vsn3KOMEIaLvjQqIAQ7
 JtAozTCAjJ0t5tm039fOMhZktLqYOP8NP8zO+frDomMipX7zykJRlULT7rmqpEcgDqWe0Eim9Yt
 lgy4rSEsjHioGewU4b15u9cEQy6xi90tNfzutaA6g5sEsr7+7tZDmwxSCrSLJIdxeGn1w4a+wEr
 l+Mu7JRt1dcedO+gwHk0WITcoCXOh1EAaoNOsqWWPzGwwCz8vWikIdWLnOtxOY3wiQ7MypJYnZg
 f1XL7EKAvbRbUC5LShT7HGwm32ctwbs0qahn5XBhdZTI+cMYsMIm0nW7f3qrK+64G29o7pAOo/+
 tTpv6K/UuV184hEC56emkv/854670YORtk3TuW5G9pk7UCvcYDztukvrpa0iSn6QLPF3QfYLe9r
 oqLFg3XUi/qs3uk5/OpAh+0wUcL1jk=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The series trys to add USB2 PHY support for SpacemiT K3 SoC,
while patch [2/3] implement a disconnect function which is
needed during next connection.

No DTS part has been inclueded in this series, instead I plan
to submit while adding USB host support.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (3):
      dt-bindings: phy: spacemit: k3: add USB2 PHY support
      phy: k1-usb: add disconnect function support
      phy: k1-usb: k3: add USB2 PHY support

 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  6 ++-
 drivers/phy/spacemit/phy-k1-usb2.c                 | 52 +++++++++++++++++++++-
 2 files changed, 55 insertions(+), 3 deletions(-)
---
base-commit: dd39930f3d9c1d74a40b79d368e1f3d1555e919c
change-id: 20260124-11-k3-usb2-phy-c4630b990b1f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

