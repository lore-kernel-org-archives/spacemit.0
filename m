Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0D21255A
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 04:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783828865; cv=pass; b=fw2uQC+LYiN7ia7Mcby/R7qYxj+A/LXz7XkwqBWoLmjlV8im0mmEVz9ti9cS3e8R0dJuxk9CxiQUQTdorOF0tgX10ZuJmWCRjtlSEwqdBjdvWh2SYCWoKgeaZDG0SbW+nxCZJ/dztTWglhmdbF6qYDoNVqVzs8xEvD6l6Yua4s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783828865; c=relaxed/simple;
	bh=L4I6HPJwdArISHcwslrK/IW2jWyiR3OIIY2y81slq6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ow0zVrY8+tI09oThZH4yVzkeWkdKvDJvnSQrjgo/+qI3jQA9kyW5gFbVp9DKdpltBcu1jLmfPt+th7abGvQBGpUXWKv0AxVaL7YDoU6IMrFd2tMD3NBQ0i7Ip5yHoGCqeKzfHrIgemjDUCYxBeogDK1p+Xbis/Bqpn96ptF7Pyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=NJwhDzrx; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="NJwhDzrx"
ARC-Seal: i=1; a=rsa-sha256; t=1783828851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h/XnjM658Nayk9mXPOaxsITQOGzSqVIpARpS9XT0pmImWLEBHQu2ipNB+1wM3eGhLUeZCyVRzeGi6CTckvhIsZwxa9g1zZ5WxBKj5p/CCjGkyKv/Ub6hhZjJ8wJfU4nnp56cc5ukEd+7Xqzge89cEODB8Ejkfx99CQm5XNgCupk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783828851; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CBuhzYSYJIgaFs6XQcVdMRF4R/1PuJ0AoLQ4+jP3JRA=; 
	b=gSPQOEZ4PBiBay3zZe6rTHADS+J4keBpLvQ35Hw8n5GVpQcvnDGwBDpdiXELoknxtNRqQd7XcBjoLMuFRvsppN+kr/i0nIosBADxK9UH8wjTPlBZBX1bL9OF9xm8BlfGKzDCMiCDkJP7nU0qtKL8xbCh/8l1XAknOYFcrOu2mHs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783828851;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=CBuhzYSYJIgaFs6XQcVdMRF4R/1PuJ0AoLQ4+jP3JRA=;
	b=NJwhDzrxObo8PEAAuYea0jJb70tujElMgmyW6S+383LEk3N8FXzHz1yGNZyzEg/q
	2kbi868PWst9j3RccW6KjMn5exEJQz+QtEvxRdI6z7jPrIcLyYRP785ZkjushY8pMak
	z6eXPBw/xoIECFDeby+9eN0ev0lDQBH3O0CGsiaU=
Received: by mx.zohomail.com with SMTPS id 1783828848851646.121581141173;
	Sat, 11 Jul 2026 21:00:48 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 12 Jul 2026 12:00:01 +0800
Subject: [PATCH v3 1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6
 compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-bpi-cm6-v3-1-8d1e2045179d@pigmoral.tech>
References: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
In-Reply-To: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783828822; l=1249;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=L4I6HPJwdArISHcwslrK/IW2jWyiR3OIIY2y81slq6U=;
 b=05tmEBYZjO7PZMUzrRXciH5oal6OpRL83COJVtNI9lhWu+FuzDh5zGjJgomzLv5/2yvR1iBct
 OaMGxaR1X+TD11FFIjS/y3PVmqk0KLmRgvseSGpQYCD19+PCZGIry/W
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

The Banana Pi BPI-CM6 IO board consists of the BPI-CM6 compute module
plugged into an IO carrier board, which is used for evaluation and
development.

The core CM6 module is based on the SpacemiT K1 SoC and provides PMIC,
DDR, the eth0 PHY and wireless connectivity. The carrier board extends
this by adding the eth1 PHY and external interfaces including Ethernet,
PCIe M.2, USB, MicroSD, QSPI, and serial console connectivity.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 311bbccba0ba..4ee9c88984b4 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -19,6 +19,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - bananapi,bpi-cm6-io
+          - const: bananapi,bpi-cm6
+          - const: spacemit,k1
       - items:
           - enum:
               - bananapi,bpi-f3

-- 
2.54.0

