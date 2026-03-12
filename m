Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344438F625;
	Thu, 12 Mar 2026 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773311674; cv=none; b=XLLJBXRHn2wHf37Ok/Z3TpoEjCeW5Yyz6FTpACXlg5Kwk8yAdzCgXGawnkVnH8s0zyadQGtZHMYx9lfeGH0qqizyAn78/h2uz6CNCUr/TUwshT38u69mo9oCKJ5ietTDapT+VitUsp3Cgace4hcVCVJuAF0U7O7InRCTEp94C0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773311674; c=relaxed/simple;
	bh=eG47Dl2Bc/ZA8mrG8zkkaZ4+w/bWA/2Y9BE8NMR8OPI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jATw8hQFK3UyzKt1fxEJsEdE7ZSIVA/2wCtntaWpajatzDrsHfyMR/XYZv98qFCYWzN6KB6WZBEEjshJFfAvjRm9Gccdxpx5tKL8RkLszpi63sSAx4tTCy+y5jNwO0ZRRnKjmAkYwpdIg0pFjDPrB7vYMuw46LOC50xNe/9uD2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHNhatLJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHNhatLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9F8C116C6;
	Thu, 12 Mar 2026 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773311673;
	bh=eG47Dl2Bc/ZA8mrG8zkkaZ4+w/bWA/2Y9BE8NMR8OPI=;
	h=From:Subject:Date:To:Cc:From;
	b=fHNhatLJTnSPpLPEekFiBI3St6bu+fFOm3/7cDd66ySD42QhhnN4YZdv6dEFwU9Hx
	 XNtescUwb/hSLSRKzkaOjnItIN03HwLX+zs1o6RhxKEOipWQV8lFNq7Cj2+A9sQQRB
	 IudIxKtIdUyRrg6Vwfk1D7RkbFthP68TMweD6SFmcaFS0CGiQgQQSicKJjQ7lfQpq7
	 hRZLp9cVGpbEt6/1bcnf9Ll88Qg3GhZeqImsnIGiaLDPWqd4kOR10/tx7a3TDZdc9B
	 24Owm+ZkTbnDBi8XimTz5ReuWJN8l6AnvshE7TPHP5gQNixc2fW2WkaKEl2eo4rrIU
	 sOVkXaJgQHFWg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] reset: spacemit: k3: Decouple the composite reset
Date: Thu, 12 Mar 2026 10:34:18 +0000
Message-Id: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqWsmkC/x3MMQqAMAxA0atIZgNpxQpeRRyqTTUIKo2KIN7d4
 viG/x9QTsIKbfFA4ktUtjXDlAWMs18nRgnZYMk6qoxFMrhUmFj5wFMH3EfBEIh89E3tjIdc7om
 j3P+169/3AyL/eWxlAAAA
X-Change-ID: 20260312-01-k3-reset-usb-pci-dd00afa7561a
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, 
 Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=dlan@kernel.org;
 h=from:subject:message-id; bh=eG47Dl2Bc/ZA8mrG8zkkaZ4+w/bWA/2Y9BE8NMR8OPI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpspatpujL2boqdEZkli7eEVCVnQvbqf8bRpgAZ
 R7LuZFjpbuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabKWrRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2sjQ/+MZkAD1W11hl4KKJoVbLZ/GRv2XFAwZM9VxPIjzqUPyGgXBBnjnxvv
 q6gHrI4gcXqIYn+LBExtZawet/TFNSuN2pdMZVOqGWJ5IE6ddL5Hs4e4FeT4JGBTZNIwnhHhzEt
 U9lWCXi2vcyZ2Gj+ecgBI+5PeU0L8aRZyjw2InWWnmkLLDOW9ZAV+CehkGA+IBf6mh28NLzIaGk
 o5F5t9BeJ36YWJYtsqRZ8GrlxcK4xWDA7kmxT0d/lXjJbJvSeEKrgno6jcxU52v+zvIhtIgkJBy
 6ssZ8QuqqrK9Nm2yZCsLWiaeVI/tGA3LUhNyygJpngx/KyFBIBu3l6ZMFRSvi+nfNUGanaID2nI
 9SId0bzDzMtPFCk+RiypcwJ1epr/o1MWCBhwPvpnptkIkbc87b+yrL85R93dsayR2ylwljX1GJI
 w66d4J6HlJOZtNCkGHXOo1E+x8nkl5anzi1yK3Pl6GRi8mODHVlKq2xw0W6FqewjNT5XWqWcwQz
 0XQf2HLihEftIcUOQKhCkXheiIB5IiLx4Nl/zJD/B/JUoclWmBZovsBg6t2Cnr7Yb1FrfMJnJQb
 2WVDA//FmZxvNOguPh5bypHvPltR9ZPRnY7gz2k5KcJXVZlUv/WzH7HHJ095UNezhh1/O1X6ct+
 163NjyYRhdAvubLJda3QwqLorIm9QI=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Previously, the reset of The USB and PCIe was submited as a composite
reset, try to decouple them in this series.

The motivation behind is that it will will make the result more aligned
with the hardware which describe them as different reset lines, and also
match with the K3 dwc3 DT binding which request different reset, 
K1 and K3 SoC share same topology of the reset line design.

See the reset part info in binding doc
Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml

I've not added a Fixes tag here, as previous old reset ID has not been
used in any DTS, so it shouldn't cause any problem. I also mark
previous old reset ID as deprecated for now (let me know if it's ok).

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (2):
      dt-bindings: soc: spacemit: k3: Decouple composite reset lines
      reset: spacemit: k3: Add individual reset lines for USB, PCIe

 drivers/reset/spacemit/reset-spacemit-k3.c     | 50 +++++++++++++++-----------
 include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++------
 2 files changed, 62 insertions(+), 30 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260312-01-k3-reset-usb-pci-dd00afa7561a

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

