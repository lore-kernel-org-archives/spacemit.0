Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D4B3C3C03;
	Wed, 20 May 2026 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320760; cv=none; b=X3Ojm0qARGgv1PFQzoo4FWRy8J9avksqzLuQHmP1v5cY562IRe16wkadmyPpH41NGFGiVBifZC9GBdsKqo44GaRR3bG7kUy37reB1JaC+7i4Gs1YhieAzxk8yLirqJTrods9JZGuuGC6QrDhxsQTDvH2Umfvk2mVZgzV1j9Ls0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320760; c=relaxed/simple;
	bh=uPlH8n214swxNWBctvlGwEm7VD7an/rw6fU2GU7t4tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIgT28kQVw4H2SbjTqNR4NNZrGdIA7Qn3KU2iNBZdzx2eUp23knMDz8XGQPFETTvdM1ql6ht09gPy4uiQgzoliraskB9o5ANKydNbJfM/eclgx7k/7zZ2axazKinnWQFX2X689jsRcl6F2XVJ712PctA+SHGTpTdS3COT9DYDr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9qrG2tX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9qrG2tX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3041F00A39;
	Wed, 20 May 2026 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320751;
	bh=cnpf5Il9CjR5HVNLrhTtw0QsBFfp3NOZahsesj77WKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h9qrG2tXWhMEhHc0vffrVG19A2qdDNdp2O3pHG/KBgdC933PmKYi/T5CJj7Fv75UZ
	 oGKIBo1F+fJ1tcakqGD8WlrwKolUWF9mjF9/KFJaRqBSA4SEXWMMDj+ekgA/Z4YvVP
	 wzto19oX967QSjXVBEF7TmdL36s5aHcsOASnCLDuRwbXd1hAGpfc7cOTRL62gIQz3o
	 2MgV572XM87QR4XdV/xIWY4aR+7iPLG3YBgee4h1i7ZEz3U5Tsi5l30s7DmUFnj99u
	 yrnl9SLz7O0WMBPdayJ2VHfhM8jJIHn8sOPwydopz3nmZjcXgsySMJAlqOx26c+5i/
	 Hha2evEk4I70w==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 20 May 2026 23:45:27 +0000
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260-IFX
 board
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-02-k3-com260-ifx-v2-1-d55095457cf0@kernel.org>
References: <20260520-02-k3-com260-ifx-v2-0-d55095457cf0@kernel.org>
In-Reply-To: <20260520-02-k3-com260-ifx-v2-0-d55095457cf0@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362; i=dlan@kernel.org;
 h=from:subject:message-id; bh=uPlH8n214swxNWBctvlGwEm7VD7an/rw6fU2GU7t4tA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDkej3kBVQ+xSb1W4oEadJ8PzABe8jCfKZSwGV
 hYTv3ATYQ6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag5HoxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0SwRAAngN6xpvL4BX+PpAQCBjfDjhaAS0AEjXtSM8d5yMjJe/yweKZ2sg8/
 5l6UsBn46c2pdp72B9pWrvVmS2uPjG34eTKS9QXZMCrTYLXA/lKyKFmX2+RI62I3dd1qyd/O75f
 wUz2tO6/VWvtbMRXmIoMcskWsUJpw+G+hDzEhTd9Q40j69gkIlDh86PQztr0p4BjDR4MNIIhISX
 6lKo/U+ysZT1LzQgUt6tJwefRBoZLsU0W8SUylsK4VB9UCT6G0fyIuMtJIXALJGOn3vXhKO7J+x
 l2DBQ+u7ban1LEka1UztNQvAGoZYvQITF9VxYmdSYSCFAkz3Mkv9zL/vDK8yQeeGbBuJf02HR1s
 qwV5XBexGvwZ2sk2Zu7TDZwh6MjLurExfSmrWw5hpapFyYppW7oireHt86ZZ/vKyVt+P0J0ELQH
 cTZdpUFCFOU3UmgK2e79j8t7/fUYHaBBhdiUPzN+WkyckiHIK0giaoGXxt/7KH44gx+6F529/Cu
 87oMgY2FarZek9VY/XbEvzN0s0D4esUjGmTR5RfXEyLFaRZjCOCWvqFVoeIF1EjswyuP8vA0Ikj
 J7k6WNJzvrXE47o+HQ9DHCO3f3FNlE/CIh94HC3xhh3bArbhyccxd7FHgroC46+9GK9/3oNKMkl
 TmBqTU24lfFjDmjQPKzBET/JKh8Zn0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The SpacemiT K3 CoM260-IFX board combines a 69.6 × 45 mm compute module
with a reference carrier board.

The module integrates up to 32GB LPDDR5 memory, UFS storage, Micro SD
card slot and includes interfaces such as dual MIPI CSI-2 connectors,
M.2 expansion, USB 3.0, Gigabit Ethernet, DisplayPort, and a 40-pin
expansion header.

The carrier board is intended as a general-purpose development platform
for CoM260 module and exposes interfaces for all of storage, display,
networking, and camera connectivity.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index af8030242bdc..311bbccba0ba 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -32,6 +32,11 @@ properties:
               - deepcomputing,fml13v05
               - spacemit,k3-pico-itx
           - const: spacemit,k3
+      - items:
+          - enum:
+              - spacemit,k3-com260-ifx
+          - const: spacemit,k3-com260
+          - const: spacemit,k3
 
 additionalProperties: true
 

-- 
2.54.0

