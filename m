Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233235E936
	for <spacemit@lists.linux.dev>; Fri, 22 May 2026 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444183; cv=pass; b=fTOf763q8JldX0ZG3aXDlFf62q9v1YguHKEWEG95bMuwa56ru2krT+vtErP8qMRDzTvKe2AfDWm7SJwnrjWV1BN71zAFXv4Vg2Auy+BG1af6Tb7h4E3u7/MYRU/9HrWmQ0oM85iLKDSNPn/Evrd+ayAGnDt3bwYcS7rVoZZo5K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444183; c=relaxed/simple;
	bh=z5N+OVVT6EV6yZfhuO94zkxdbEVGsxfaKjRVmwzsiWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngw+BXRSFxKPti2kO8L6KeHXjC4baBmywEICS2BJHZy8cd69iO955jBg1yTC8/duxDqC4fXKkJ/FwHF0dPFzeXf/XaHQJH+r0TeD5huw0c+CcUjH9MUtUXkUboauyNy5NTnSuI5mTO95ukN8tgJNqGpA3T+4B5D2gMSmBiaJpm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=cdUwSwzb; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="cdUwSwzb"
ARC-Seal: i=1; a=rsa-sha256; t=1779444173; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xc0m69owLNfANcQY0LWVnc1BjlfPQ9WXnXGvbMG23jXlQkfx0kFPTtrKMh+7aZZHAZjb7sRgbZAY8y6DPco7B85OILacZI1bDxaVTiE/tv3jCqoaPD92ZBUVVbwnRx4W4UD0PGCIaUSl4fpp8wyeJY8iYZSJ/Sd1dASMORUUbf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779444173; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AlUtXwWUEIpdy2pCmMQSyi1r/hlhyzAXZ22qS4CeVmI=; 
	b=aFtn+ZYpgQ2TYqRDwY3yFungqxXxXE2ovsV8LpzYaTExcTNMv0LFdwUhyHNJyNP/OvVedhWN3hEFjRxvLv4Ia63N39hs8pD8aklg9Skbbxjf/nPdSnX4zsFUsCzVVZr8bLF0KXQbDq0L/TiRmrh2LRtxtMdn19QziMpNOrEQLvY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779444173;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AlUtXwWUEIpdy2pCmMQSyi1r/hlhyzAXZ22qS4CeVmI=;
	b=cdUwSwzbyCrCxMfGiqenriZvbjLAOoCA6S+BIhN7a39Fr4cMlqmehsjDjiviHkt4
	xql0k9RSpo4YtFWZ6JI2ZDTqi0qiqLLNsn4mnzN0abK7Do2sUj0viiAo0jjT+/enwNB
	FonfdsuhPmsfJZ8LaZdtW1YIwdcE4pJdHSUYrPG4=
Received: by mx.zohomail.com with SMTPS id 1779444171827541.6484481209804;
	Fri, 22 May 2026 03:02:51 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 22 May 2026 18:01:33 +0800
Subject: [PATCH 1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6
 compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-bpi-cm6-v1-1-707ef1917a30@pigmoral.tech>
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
In-Reply-To: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444139; l=1196;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=z5N+OVVT6EV6yZfhuO94zkxdbEVGsxfaKjRVmwzsiWI=;
 b=cFHT3CkVUnmxwXwbI2bSYm2w/plb8ldyYCcHXucbIdz18H/HUccbB3xs7gEJgHDcm8RLfhIqq
 d0uQH7WwjlXB6TuGOTOm7kordIbplY34lEglG9GVzBIq2s0zFYwvHEK
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

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index af8030242bdc..3e868383eb4a 100644
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

