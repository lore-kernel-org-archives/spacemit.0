Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4848C23AB9D;
	Sat, 14 Feb 2026 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072178; cv=none; b=PmxbCozGVSJDhipnFnYcpP2nJTIsEtC0a2l8FwJg0OxnyCdq/rLA2/Y55rxcE79Po1g90c4IKUGWMMOl85hm60Z0sVfsocHQXo+eTFqPk6cZwYlnCYDIfXplo4rxcbA6RGKOvSgg5+CbvYLo8Ed0N0KMfVm/88hrNeSMExkJ+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072178; c=relaxed/simple;
	bh=FPSzeY4L8d2CCnRHcA+rC6sVrZLrbhPdn9q99p00ok0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Psej4zCcfsR7uMk1J5G+mG+ThCqK1Ceotn3hiyC+sRbgskYLZVNly20ZIT1YLrEjLxGq5ILJ6krU1imY4NSNJgQtYO69L62p5IZUTVn7oW680TRA81RG40xYnKJvqmIocfXzGXsRmyZgmd42Px8WAuvgJ5JysQqRII6BUlk+f94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Op5T2vb3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Op5T2vb3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477C6C16AAE;
	Sat, 14 Feb 2026 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771072178;
	bh=FPSzeY4L8d2CCnRHcA+rC6sVrZLrbhPdn9q99p00ok0=;
	h=From:Subject:Date:To:Cc:From;
	b=Op5T2vb3Fvx8dW7A492rp3/OcjjOFfkLhFv6uX9Li5iLTWP4q2Y1xiQBY4qcWeYIR
	 x+0gxI+DiclmDKSsMiPNFXxA7EaIvRjxO9ZL98LXTq4VeGM1luWaOikXUJZg5R1fPh
	 gTdKodC7VJhZyEQ+dCNjSFFhbHza6+atcECR/6bWeLPOExwGOPO2pn5bIuPYpQeHCd
	 GvNAC0UnRCNMXXxpG5F56Hr45z8QrKtiaN1ZdsgzY3+waWT31Rdcxd+t6kln0+a0ZJ
	 GljaoiV1wR/cvYsbkV66GtKZoUQdb59vCW292l4Yih/2q+r+6YIHvOtnr+TNobU0WV
	 Ufyaa6HZvOv9g==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/3] phy: spacemit: Add USB2 PHY support for K3 SoC
Date: Sat, 14 Feb 2026 20:29:13 +0800
Message-Id: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJlqkGkC/13MQQ6CMBCF4auQWTumMxQUV97DsLAwQIMB0mojI
 b27FXcu/5e8bwMvzoqHS7aBk2C9nacUfMigGe5TL2jb1MCKS0WskQjHHF/eMC7Dio0uc2WqShn
 qIJ0WJ5197+CtTj1Y/5zduvuBvuuPYuJ/KhAq1HlxOhcVa1W011HcJI/j7HqoY4wfnN8moa0AA
 AA=
X-Change-ID: 20260124-11-k3-usb2-phy-c4630b990b1f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=dlan@kernel.org;
 h=from:subject:message-id; bh=FPSzeY4L8d2CCnRHcA+rC6sVrZLrbhPdn9q99p00ok0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpkGqhv+68CuVQu0sNLX7qFVvE4UzfaxiA3N7Ib
 rc/KZWB4imJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaZBqoRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1isxAAhK4p6SCbFpn2lkAnY8/iGriAjK2qY5eQLdciI9Id1Wgx8nh1+bSJ/
 C4In+v9trr4v7i7spKxTzvXsMDL4DgE8WoIFYg1ToCVJ9HujzWPoLoAhUErhP0emAMEAHF76fZq
 zSbCYphbM1Oz/X1t+kf4MUD7uKk1S4hFR+tG6m8Uj2m1bTCITul7d4HHPpW1T7AWJdJdMdHoSHM
 LtC3sI+KnmIznGeLiFCBoASfUO2/bbAqqk9+k9SQ6nO67ImPTY4cJMHxJiu8LDh25YWs5mhEm/z
 DdtKUyoODcnP3N/GjBJEDsJPshM0242hUZ20HQceBEJbrBU/MPWv238gO8YHAef7Eji4JHzY9OV
 VT4qWjLegfjb6QBVTEmtqpZILwDZZlBz3U07ECLdqVf5CvVwWD+rBQxAR7mS5k0frxULDy7LkHH
 SEoGgkj0vgs2bYQ2ngiRYriMGGE5BmN770Fbwz4ZpJcKv/TW74EafHStJb3sQtMQNvvSMgO2qfy
 Xr/rEzlsu07QateOzRODjsZcC5xMdR4SqfJgxjZTAPZNnw9ZAQUgwAXf4q+PKsLt1euOqy1tQEN
 oZSWp9HYndKmEUQw3TLCqXpdk5uXLXJ4JyAOZf3ABua3KjiTy4IqW7FR7+FLOmKUXDG3M7nQUM3
 pSih1cJGkbXV81NsT9TImPPcQcUoTs=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The series trys to add USB2 PHY support for SpacemiT K3 SoC,
while patch [2/3] implement a disconnect function which is
needed during next connection.

No DTS part has been inclueded in this series, instead I plan
to submit while adding USB host support.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- collect ACK
- add Fixes tag
- implement separate phy_ops
- Link to v1: https://lore.kernel.org/r/20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org

---
Yixun Lan (3):
      dt-bindings: phy: spacemit: k3: add USB2 PHY support
      phy: k1-usb: add disconnect function support
      phy: k1-usb: k3: add USB2 PHY support

 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  6 ++-
 drivers/phy/spacemit/phy-k1-usb2.c                 | 44 ++++++++++++++++++++--
 2 files changed, 45 insertions(+), 5 deletions(-)
---
base-commit: dd39930f3d9c1d74a40b79d368e1f3d1555e919c
change-id: 20260124-11-k3-usb2-phy-c4630b990b1f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

