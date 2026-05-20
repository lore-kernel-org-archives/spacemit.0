Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579CB3A1D01;
	Wed, 20 May 2026 23:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320756; cv=none; b=onAYZcqtSyLhA6ZIn/lhY6o97OC1rC8K3G4OZ8TWHj19r1CSXQPx5zQHgKIJ9LJqFkTEhzfJIZ3SOLLOePO49NZO4tqXddahUtNhwKen0rf1ZlwqHCImGTvU1/YDpNa0mOrO4m3dqczcImsk+9xygyvll7tbrW7PcPN3a1RHPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320756; c=relaxed/simple;
	bh=mfu4IvSdZnvFP+/bTmA+E/QlsPrVl5Rf9/lgIeSbnaY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uycJxiPqBuaRqPvqo4hVvkCMUlSgUG6jhoQMmznI4wej4kv2ClMnLCkdNlWcik67GKlBjD4n/AcihprCPpD1EULT+JBadth1Dnncm04JRMP3JsjwwH8skk7RCav6fo3HUYTtubxhouOjO/4lyPUI9tiuK3sXJboNI7h348MHGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3tF3hLn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3tF3hLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804881F000E9;
	Wed, 20 May 2026 23:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320748;
	bh=jiTv5n3ujX7ACkkUTLe3Pwwy8YmjGp/zXCjXgG0+tAg=;
	h=From:Subject:Date:To:Cc;
	b=f3tF3hLn22+qevBDqRbh6nB1lv0hRlEQ9l2TaI2CUe3Gwu55CscfItiqyRlkrJmxK
	 PGyUILv2EE8HSL+GXmrPwZcX8d00U55uEOcPupYRTfAHL4XFi3171eGi8aRoloEKHc
	 rM22dfaxi38SIUiSuIITUjwiWgku2Z8HTWZLjzkMNCbQ+rHXqNPE3Pmx0fwsKg7A+Z
	 zxB5n2MY4drNj7hqmWJSPabpN+0MqJq3bIYT65qw4jD3rLpBfSCms5qwyPK9vm6w9b
	 kAV0v11aR6qFoGxXh5LzAmq4c3yus8pd8AuoHoJxFJFOHuXU9GoPhtNtt5mO+8G6KB
	 x0BmSxZ0bL5Fg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/2] spacemit: k3: Add support for CoM260-IFX board
Date: Wed, 20 May 2026 23:45:26 +0000
Message-Id: <20260520-02-k3-com260-ifx-v2-0-d55095457cf0@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJZHDmoC/2WNyw6CMBBFf4XM2jHTYnm48j8MCx4DVLQ1LRIM4
 d8t6M7lSc49dwHPTrOHc7SA40l7bU0AeYig7kvTMeomMEiSCSmRI0kcYqztIzDqdsayjCVVOXG
 iUgizp+NWz3vyWnzZv6ob1+PW2Yxe+9G69/45ic375SX95yeBhDGLlJRqmlOWXQZ2hu9H6zoo1
 nX9AAfntvrDAAAA
X-Change-ID: 20260519-02-k3-com260-ifx-aa320b90e657
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=dlan@kernel.org;
 h=from:subject:message-id; bh=mfu4IvSdZnvFP+/bTmA+E/QlsPrVl5Rf9/lgIeSbnaY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDkegMJ/sECeDk7ns8h3eMW2CcEdN/X/rVChgb
 v80U3FlCvWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag5HoBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0XKg/9HTQ0sqcGUAB612h8m0Vzpf68WCLCJ/F9vQJNFO8zWUUPAH1J8N79q
 9Z66DJiENBNokcEox1Y4kC2ENF6Mh5jPBBBx1NCwXsfZy2YBx3r+IL4mcsQlHdasgkMhzASwECQ
 yLw9ieFzjr7TPfh9jPKJ13vnijmjY9xBwMTWEBaOgc4pVAjee8FyuwwRqMuNwvEVplvlsFwM2+l
 FThqLnLEPX4iNzKZ2wDJFjU61y0o6vgSXX4+mk8iUViAeXN8yP0YEO2FBrU5hldsjOJJnaMOYwO
 02ZkuqPOJllHolAgwHb7VOWAPR2K8TirmJRsm5DxnkIEFP2NUm7leso22C/ji9tGrA8aUsQfFu2
 Dk/EZOe3pjpGOf/MZTQUU/RdKO/xDycdiT7R5N22UwBwsOJITNnCOnJxUm8edtEHI8Ex47rZCxn
 yHtOLFbe/FasfNtsgOXH9w66/9ipSh0tnLX4awEMTkAAQsge/qY+3pcJ6gT7eJ0ibYwHBVgAGWo
 0ain+fTMt2yiUZ/kfqSozhhzyPBvtI83JC5hGgho9p6RtJEum24EKIvDghsiX7ezxveHrlvxf61
 9TgUmudtsdiaWyFFkeCLF7mrtcIlp1fU3/Om0WtpUys9Akbacrd79OxyRhyv8oeHsNu2u9r5qV6
 +W7ScPX3QhNdZLgGjHIvumC5mbe+L0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This patch series try to add initial support for SpacemiT K3 CoM260-IFX
board which combines a 69.6 × 45 mm compute module with a reference carrier
board.

The first patch introduce new dt bindings for the module and board, the
second patch enable support for serial console and ethernet.

Link: https://spacemit.com/community/document/info?lang=zh&nodepath=hardware/eco/k3_com260/root_overview.md
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- collect tags
- rename to more generic name for PMIC node
- align pinctrl name for gmac
- Link to v1: https://patch.msgid.link/20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org

---
Yixun Lan (2):
      dt-bindings: riscv: spacemit: Add K3 CoM260-IFX board
      riscv: dts: spacemit: k3: Initial support for CoM260-IFX board

 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |  21 +++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        | 190 +++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |  33 ++++
 5 files changed, 250 insertions(+)
---
base-commit: e2518e8cb1dde64af2d1bb246639bb7ef7523f7a
change-id: 20260519-02-k3-com260-ifx-aa320b90e657

Best regards,
--  
Yixun Lan <dlan@kernel.org>

