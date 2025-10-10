Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.65.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1A1DFD8F
	for <spacemit@lists.linux.dev>; Fri, 10 Oct 2025 01:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.65.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760061499; cv=none; b=IHF9E2rPg2V6DeMMwEEe8qj0KRQcGEDdq6uxojC7tpMUR4E+y2kxPikxUY8hNXfWqONqJC0nKWOU/9lT/KMh1JnFqMxb9jqTp7wq0iKgAl0yXsgwh9fd93MXwVpF07Mm1aTNWSiaJ4VSscIih/r3InTgOi9kmFnRaMCm3ykWRkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760061499; c=relaxed/simple;
	bh=ooFfofg3THi0o3bPDJoZZmYqUSX500L5M3Ie3KTomQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGiMOax/dK3Jpfpz5CMx9s5AOmVKzWNpkDXsSxviS7AaVcetGyk8MXJG4DVbA6Sgi+9OKpgwSAFQqu3zd7cM5IcYLB73XbMNcgwntE1h+dVQ/NsZxkz0M1g95LOH2hqcMHqE+jSTi+TIW/1ffMJ9U4fI392WIIKfbSH4NM2Ub+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=K6jl86+1; arc=none smtp.client-ip=114.132.65.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="K6jl86+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760061415;
	bh=OcfVMK6zs5edwxTbccOuT3PYsnF5yyJeWpncUgVm7OU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=K6jl86+1SelF0shRWj7Eh0tPsdjywcSpR2XAUwOeAxHfqUSZz+YP5Oj0rIufXAYmw
	 tqi0QV82ggA46TQvamInc6W2k55ayCmn149w24/hsRzr4LthiFctxuU0trDhg0Y5Ae
	 Q+QBrqRjZiyHZge3HLseIw6/LC8rphrakeKMCAxU=
X-QQ-mid: esmtpsz21t1760061405t7d47b63c
X-QQ-Originating-IP: matQ3Ugr3EH/fuWS18RWMCswPJQtU83D+PuIwuHwPXc=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 09:56:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2672388393376587538
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 10 Oct 2025 09:56:30 +0800
Subject: [PATCH v2 1/5] dt-bindings: riscv: spacemit: add MusePi Pro board
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-k1-musepi-pro-dts-v2-1-6e1b491f6f3e@linux.spacemit.com>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
In-Reply-To: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760061399; l=2561;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=ooFfofg3THi0o3bPDJoZZmYqUSX500L5M3Ie3KTomQg=;
 b=kIwAlm93xlsEZwNBaI+LdFvXe5v6i5CIHyps44SQKXhWutlsqYTP36ZX/hhk6r7LmK7OEKhYC
 vBp0C+cRH9eDkztNUawFEYuv7pJzc7K7QCzh90CUq8l5LdQmqwf2Y14
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NusmpNNpRw9KZn4528E3aJJ1fsfocxYSf4H12zpEz66AISclnywNn00E
	Ydf8bp7rtI+t/iXFxsT3fGyCihMAIul4Qwsd+HsFwpjPFyX0HE1FBGtlpqptoX7BVvBs5WL
	1Jx4fmHtYiTPbichB8QyFWHaOvF3YX18zrZWkshb7/janhOFOJGHIpAntplyLfFF19gGIlH
	3x1HTV/Ss8NGqmJWapV1x/ROrA19aPaqoGPJYxS7P77Eq3yAiOxtfGJ+++RgqD4ZoMycJbP
	/EnajcYjjE2kxlQt7JpfVLKgep36N3fzkOsBsgPVq2xXwOb7On0rUNkuSPkLF9gK4ndYJ4M
	+iwYqJyr/Db7epRGL6F7X4Sg5kOxfejNLqbcQqtBhKeBPy4bbDypQFxOzsBJKZIlSuEb2sV
	bc8VLtZwGa+HG5EqMLRQZV7S3honAVWGXmJTf/I9OeHJQHoit+Ykt/+KsVbSP3UpSGpGSKK
	NE1JUjAoI9WzdfOdgeSED8JHiwwUxSSmXUxWA9xRpwliOsaH7rpxPWIRWD+nqM8/3uF6NG5
	lYq9CF6Ps3wj7AmrS7iWbS8SjES332Q9uMMgM2KYs186rBXhKTBqV5NpUnNEkvwjC29HPKq
	vQH6znlfj1F4rdUBxzvj/kPkJzgX1Oe75YTmmaf1NY7BStvT8fn2l/LuKed8+aiiIEZa5Y9
	5CVgMasHdRX7McZlwdO/97UHjcLhsAzHsIZxPQ664X+eo7NfY3tVVia6RGb54MFy43yAFhF
	K5lE9EilQ8KD4QUVKcWxg2kCpa5IZ/pSpaBNCydIXZAv6+gTkTLxd8fJpLtCAJPT+oFeJc7
	UT+07AiM7aMNuuh7qlMoyQ3DeIjM+jit0pjeHwj8UewRnoHwqy5e9IRwWT40mYYTROF5mzX
	NcMPd5QE1qeQWKdb71VrfE4TewsV+wWFkcAv57L4hclzgHRTHsVo5626dekyGWeK20WWScH
	I8W3AjtxdPcnrtdqjua2dUYT8kTLaAINI8kgsbCm2feZvjOmdt3VyG6AhBTzfP0iskwY/ap
	i6RFW724G8NCZpjrmhbtYeJhsQUXIYUgQcxhaFqJohFH1QtHmgPlIDZlqo+2It28USlEcga
	UEJuwxc/Ef0lWng5tPuP4JLHVImFzmWz6sgFIO3kXPlEZcwGvCX5X/QmTPOFKnC9E0U5ryz
	8savxC9h3KX1AUY=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Document the compatible string for the MusePi Pro [1]. It is a 1.8-inch
single board computer based on the SpacemiT K1/M1 RISC-V SoC [2].

Here's a refined list of its core features for consideration:
  - SoC: SpacemiT M1/K1, 8-core 64-bit RISC-V with 2.0 TOPS AI power.
         This suggests potential for light AI/ML workloads on-device.
  - Memory: LPDDR4X @ 2400MT/s, available in 8GB & 16GB options.
            Sufficient for various workloads.
  - Storage: Onboard eMMC 5.1 (64GB/128GB options). M.2 M-Key for NVMe
             SSD (2230 size), and a microSD slot (UHS-II) for expansion.
             Good variety for boot and data.
  - Display: HDMI 1.4 (1080P@60Hz) and 2-lane MIPI DSI FPC (1080P@60Hz).
             Standard display options.
  - Connectivity: Onboard Wi-Fi 6 & Bluetooth 5.2. A single Gigabit
                  Ethernet port (RJ45). Given the stated markets,
                  this should cover basic networking.
  - USB: 4x USB 3.0 Type-A (host) and 1x USB 2.0 Type-C (device/OTG).
         Decent host capabilities.
  - Expansion: Full-size miniPCIe slot for assorted modules
               (4G/5G, wireless etc.). A second M.2 M-Key (2230) for more
               general PCIe devices (SSD, PCIe-to-SATA, comm boards).
  - GPIO: Standard 40-pin GPIO interface, as expected for an SBC.
  - MIPI: Includes 1x 4-lane MIPI CSI FPC and 2x MIPI DSI FPC interfaces
          for cameras and displays.
  - Clock: Onboard RTC with battery support.

Link: https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- modify commit message
- Link to v1: https://lore.kernel.org/all/20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com/
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f1ea5ca9fe28caf45a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - spacemit,musepi-pro
               - xunlong,orangepi-rv2
           - const: spacemit,k1
 

-- 
2.51.0

