Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB033263B;
	Wed, 20 May 2026 05:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779255632; cv=none; b=DkXTEW+/hdTCKgGsPDKTIVJsCfHKfHIKzVl5vT6lo/2wt8z4Vq+5GL25RonCE39R6Tl7WEJyI5+IHjhX+ATVW8gf4sM3+8GNJ/HSB5SGOnUgYstKLbwYqQAwfrRcDNOxq6jmr8h/EvPEZUQ+kjK0CtN9qyJBEqvguOSvUTKM1xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779255632; c=relaxed/simple;
	bh=PTWNrj2EOir8tvFCl0D2bADOwX8TZBknr7SRkq5Rz3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0KciCQJXQH4ksDGSqVrvFgUDEbeB5gPUIjeHbm6jV1lw/7E5vKTMcKt/S2qrH3dkx6u6JhMiD69qMXQQohYZKYuZVrO0YxCTZqEss9lXIP0plV04AZBr5wsvQy7rL9N/vzWUUKpf7S2BgxQth2DYCzHVKhPX3lTS4e47WbWwiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dq83AZeR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dq83AZeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EC81F00893;
	Wed, 20 May 2026 05:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779255631;
	bh=hskoKxPxA+rLIeZyASuc/YUUv6op0WDEVVkfPNeqohk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Dq83AZeRXJ4IcFOF7fZsAQD7mVhlOaxAPawFCNxJbqpm+AnIjPLgfVf8iVdNeSgul
	 oRfW6PzvSmuXDzSB76Qqke2C9V+pUxsm8JmrlbgaNk6XjFvcL7x2rJOzugHyUVIhhq
	 w9pXEOorlb3tcdkWitRjdnd3l0XYSJcnecVp2mRfQDqD858X7M4vQOIz/LaugYV+cO
	 DNa+4D6IgBA5EBA7NTd8M9+ORGzLgi+qk6Eb1pYo6KGIO+VWqQB0tznS4AZicZ8sVR
	 0ip0AO76j8KY4LaGn4xHKkNmZhSXFdvQAH/QzvQre7vAT7qs55lFZZ8z0wD3YhwcDt
	 ND93SkUt7t0lA==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 20 May 2026 05:40:09 +0000
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260-IFX board
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-02-k3-com260-ifx-v1-1-3e17055dd488@kernel.org>
References: <20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org>
In-Reply-To: <20260520-02-k3-com260-ifx-v1-0-3e17055dd488@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=dlan@kernel.org;
 h=from:subject:message-id; bh=PTWNrj2EOir8tvFCl0D2bADOwX8TZBknr7SRkq5Rz3I=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDUlA0mQ0YFFU03ko5IeGqfkGdKZyHj2e4tjj7
 5JjycfJ5oiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag1JQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1BYQ/9GHycg3ko7+ZDaIVjMyv3apvYP0IW0d6fArF0XVSEQJHyozmu1qQs/
 5//wzFpfks0mG1n7e+/bimxn0XWleI2w6hIH7jY4/ReD11ZbxLVKq8zs1WadMwXvWRMMPoK9ig1
 6ipSTUdSb4rbsgLJD/F3R7S7bElVbWUcgSIIUntU2SxIKCG0vz1iYQabFHwwq5LAysGAMTIIC62
 QUyxudWWO8S2WiSPPwh0lCDQOVEdJ1PeImqcEC1Pqv3cKuWwDezUFZONEQRZU+xYPC4pmN6tpzH
 L1+Wy1wTcM/nxwUg+5ZyRLt7gN2nwCzfjFx4xovfYw6CSyKwDOyB3mnHaWsifCea+EJYcBM54nR
 rSSFCNPWz8u+SRPa8rFI6SYEBmrfsqbAeZmC9NcPBkNRksimT83YbFZkAmx4f3jrocy002RAq/P
 fyNQuV6DRru7qsv8HuP3jVJj4O136OzHX83R2FYpIIy6C6QJDBbf3ABNzVJBdOKMvMV4asTIgTE
 LcGpsMjV6V8fLitWfFzAX8hqfVgx/LDSTGfdA+prHX6FZf8hB9lMx0OnvBETXo0pS+Q4YJcjMrw
 QKiWzVKQ/44u+T+wiHhkw3DzoY7FPT/8CQ+MbIfdafSuSGyzLI6YUgG2t507aAufyCBgdLTVhiY
 UadylKV5i7/xELaNsHrB0n5xnjdfpM=
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

