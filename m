Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4853D531
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022338; cv=none; b=V3oX9wRtQ0J7bhUvCxZmrEakMO7VkiSK4XgcWCowEGV06GhmcQSeT5MROEO8zZusyVJLVwk0ptSELkNSVh0yxFVbMa72XJ7gJv8ay16xhxrbV5tkG8sG5qHjBMoLW/Wyx6CiN2fXPN+sV8/FXj0PvzwaybATH65gh3GGS2s+r+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022338; c=relaxed/simple;
	bh=JkzhGdqI+PaPbPODmI7rQFPqBMywGTnzk2npuKDslnw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Psef3BkpRhIkUzAI5DwjKWumL48Rq5am5cJ2M272Vx+skTAHMpvnY/WVpMYeT5aqcDeXuNQ+9nrBtIjjKQJTx74uqFIdQWtb9zkrMk1xxiOYC9wjWXI0kic3MQRrK35IR4zpZmBcBUDzOJIIK56EglaliCSGnxkKZmTvcm5pSSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3GHFs6ek; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3GHFs6ek"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a099233e8dso35739015ad.3
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022336; x=1768627136; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwINnpUPFb0M8hbnqw2ipXo4djJBXYPLd1SCBqsQOZA=;
        b=3GHFs6ek7Cw6nM1RzYjBJHt6o20bIlOIJ01Kvt8NQnr92NYLzi5aFfpvfXncgIz4zQ
         Oc5Esgt5kAugh4V97W/iPz95doRSv7qxzP2FmoMJFj0/G06HsTNYbIbkRY5qh2/AHX69
         vGyhSWueaB7Wb7UnJ4Kdh6j2Zd3+wI+1+kiMP+Yn9nd1ASiTtXEjKONEhqq++tXMwfvr
         awZqSWEvYxC7xqAzzKE1WGsgkZ2HHlXDAYuyMVqGpZWQst+3oqpabZijBBoXV651SuHN
         or2X9VUbxsgGP8VuEVzw//SfPifk53mIrkclxheTHs1dyhAjDaEDz4Tg+Rw79+h8qUhG
         PCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022336; x=1768627136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwINnpUPFb0M8hbnqw2ipXo4djJBXYPLd1SCBqsQOZA=;
        b=gXqJOdrOsXSw6oIY72jr1D1kurLiIXBq8lQcJW0jhxALcqPbvtJ0Q9qWyh+QP/w8/o
         Rv92nihoB4pz0EXRIbLn853+TPU6rJUVAkPJeTNDth6gDBc1v+Mmvaa4FQSDHCpg4wwK
         wOzoVxI3W+NcNkvj0dOZWp5891qrRcNe7zMVE6OHGIcWJJuMDsQmCIa0B7ps5xflDGJN
         ZDrYHrJGPzHQEGSyu7UZ7DO1DNa5XFfKwBOrkj32eH5Q0dF10+qC+YgWqCvIHzsfGTU/
         VPSZtYMaCg7kX2IJbzmbr6FOwULollUirBAsXHiallqjMfvlQDO1+pkBlT30A7Tjd/J3
         sVNA==
X-Forwarded-Encrypted: i=1; AJvYcCUDRyMfnNtjEINqA+mFqSJmIBYKgWiXFV7ILO2z32PNXzOpXvlr4DPX35Kr+1D5xczFI0OWCQV8Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXgD+wN75vvsZLYWMQ1f3+aOR8Zu9orN0knUwLC5OU92bhXM+P
	yFffYxXn3BZ/MngMMBUg6oYdEKDoh2mpNuCYoqM+YkWUZSpeb1Yf2GkWcjoxVpBDb5M=
X-Gm-Gg: AY/fxX4rNvJ7IJSQ686w45Flqzl5KlwNoXQ3z8dX00MjcOZto4gHuyHzCxRGxJswr5U
	ArWsITgrIo0MlauuBryCnaLT6idAab0E24rLJramuowRUO60jf2np2/aVrzaT1AJP9mqgGT4vl4
	UFyazaxZIehPLYx2u5xlqOwgDDQ7Y9jQZlj/5QPq1B+YzkAPZc3hmKq0LIaQgB4BNdLv73QYG+j
	XzkPUL2P/zvD1p4LGPfj9dbPBki4K0uftbdri6Dy2tSyOrfPakGhw5/pQaGndYnjXLJJuey6bjT
	4olgqYcq/doFm6oEB0IcPYR1MNxmeAKRtvlPzN2p53oAmDEXEP2iaeEFzVOccQoihmwePd+pDGQ
	iRVO4f1XuU6wwOgBE0Q2N+cw+uJOWLIdeExHSnOQJdguo8OanTQO65ldJbbgNRUolUVWddjFD7T
	e3TAgEL0ewmHV75zU85fr/9fwC1bgs0G51iy8+K/YqZMx1JdaGxCiCcg==
X-Google-Smtp-Source: AGHT+IHgj01KDJwIVi20hSTPJNWxRc9OnOAfkIzPOzB7+X4nvk7f4qSMG8zVfgmzJIM3AOdnYhkWSg==
X-Received: by 2002:a17:902:cf05:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a3ee49015dmr105294885ad.37.1768022336093;
        Fri, 09 Jan 2026 21:18:56 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:18:55 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Date: Sat, 10 Jan 2026 13:18:12 +0800
Message-Id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABThYWkC/23QwW7CMAwG4FepcsZT4rRVw2nvMe0QHBcsRLslW
 cWEePcZ2KSBOP62vl+yT6ZwFi5m3ZxM5kWKzJOGdtUY2sVpyyBJs0GLnUPXw97DJhYhSBUoha6
 1tndhCEbFR+ZRjte2t3fNOyl1zt/X8sVdps97FgcWok3Y9RQSBXzNUqjUmF9oPphL1YL/OOI9R
 +U+jn70lOw4xCfc//HeOjvcc6+cUwi8acnH5B/4+XZZ5s8vfU+9nWeUM+j+IHXdTHys8FseVJx
 /ADq4RXtYAQAA
X-Change-ID: 20251216-k3-basic-dt-cd9540061989
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

This series introduces basic support for the SpacemiT K3 SoC and the
K3 Pico-ITX evaluation board.

This series (starting from v2) also adds descriptions about ISA extensions
mandated by the RVA23 Profile Version 1.0 into riscv/extensions.yaml.
There are extensive discussions about how to handle these new extensions
in v2. In v3 (now v4), here is my best understading of what I think we have
reached consensus on.

At v3, Samuel Holland shared his opinion regarding how "supm" should be
handled [3]. He suggests removing "supm" from devicetrees not targeting
U-mode. I did that in Patch 10/11 of v3 with k3.dtsi. Samuel also notes
that "supm" could make sense as a binding for devicetrees targeting U-mode.
Considering there are other changes suggested in [2] and [3], I would
prefer to start a separate patchset dedicated to "supm".

Among others, major change in v4 is adding m-mode imsic and aplic nodes
into k3.dtsi (Patch 10/11) to better represent the hardware.

Hi, Conor

For the binding riscv/extensions.ymal, here's what changed in v3 (no
change in v4):

 1. Dropped the patch of adding "supm" into extensions.yaml. At the same
    time, I will start another patchset which implements the strategy
    outlined by Conor in Link [2] and by Samuel in Link [3].

 2. Dropped the dependency checks for "sha" on "h", "shcounterenw", and
    6 others. "sha" implies these extensions, and it should be allowed
    to be declared independently. Like "a" implies "zaamo" and "zalrsc".

 3. Enchanced the dependency check of "ziccamoa" on "a". Specifically,
     - added the dependency check of "ziccamoa" on "zaamo" or on "a".
     - added the dependency check of "za64rs" on "zalrsc" or on "a".
     - added the dependency check of "ziccrse" on "zalrsc" or "a".
    The commit message of this patch is updated too, to better explain the
    relationship  between "ziccamoa", "za64rs", "ziccrse" and "a".

 4. Enhanced checking dependency of "b" and "zba", "zbb", "zbs", making the
    dependency check in both directions, as discussed in [4]. Since "b"
    was ratified much later than its component extensions (zba/zbb/zbs),
    existing software and kernels expect these explicit strings. This
    bidirectional check ensures cores declaring "b" remain compatible
    with older software that only recognizes zba/zbb/zbs.

Thank you for your review.

Because the K3 uart compatible string patch (Patch 5 in v2) has been
applied in tty.git, the entire series now rebased on top of linux-next,
tag: next-20260109.

The SpacemiT K3 is an SoC featuring 8 SpacemiT X100 RISC-V cores.
The X100 is a 4-issue, out-of-order core compliant with the RVA23
profile, targeting high-performance scenarios. [1]

The K3 Pico-ITX is an evaluation board built around the K3 SoC.

From an RVA23 profile compliance perspective, the X100 supports all
mandatory extensions required by RVA23U64 and RVA23S64.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@spud/ [2]
Link: https://lore.kernel.org/all/4ebbe14b-2579-4ba6-808d-d50c24641d04@sifive.com/ [3]
Link: https://lore.kernel.org/all/20251230-imprison-sleet-6b5a1e26d34b@spud/#r [4]

Changes in v4:
- Patch 5:
   Adjust maintainers list in alphabetic order.
   Declare spacemit,k3-pico-itx as an enum, which could save future
    code change when adding new boards.
- Patch 10:
   Fix missing blank space after comma in simsic compatible.
   Add m-mode imsic and aplic nodes, per suggestion received from Samuel
    Holland.
   Adjust node properties order in nodes simsic, saplic, mimsic, maplic to
    follow the DTS coding style.

- Link to v3: https://lore.kernel.org/r/20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com

Other Changes in v3 include:
- Patch 1:
   Acked-by: Krzysztof Kozlowski
- Patch 4:
   Acked-by: Krzysztof Kozlowski
- Dropped Patch 5 "dt-bindings: serial: 8250: add SpacemiT K3 UART compatible"
   as it has been applied to tty-next.

- Link to v2: https://lore.kernel.org/r/20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com

Changes in v2:
- Patch 1:
   Fixed alphanumeric sorting order of compatible strings (swapped x100 and
     x60) as per Krzysztof's feedback.
   Update commit message with more information about X100 featurs per
     Yixun's feedback.
- Patch 4:
   Fixed the order to keep things alphabetically.
- Patch 6:
   Use "one blank space" between name and email address.
- Patch 7 ~ 11:
   New patches. Add description of RVA23 mandatory extensions into riscv
    binding YAML file.
- Patch 12 (Patch 7 in v1):
   Removed aliases node.
   Updated 'riscv,isa-extensions' with new extension strings available
- Patch 13 (Patch 8 in v1):
   Updated the memory address to the hardware truth.
   Added aliases node in board dts.
- Patch 1,2,3,5: Add Reviewed-by and Acked-by collected.

Link to v1: https://lore.kernel.org/r/20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (11):
      dt-bindings: riscv: add SpacemiT X100 CPU compatible
      dt-bindings: timer: add SpacemiT K3 CLINT
      dt-bindings: interrupt-controller: add SpacemiT K3 APLIC
      dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
      dt-bindings: riscv: spacemit: add K3 and Pico-ITX board bindings
      dt-bindings: riscv: Add B ISA extension description
      dt-bindings: riscv: Add descriptions for Za64rs, Ziccamoa, Ziccif, and Zicclsm
      dt-bindings: riscv: Add Ssccptr, Sscounterenw, Sstvala, Sstvecd, Ssu64xl
      dt-bindings: riscv: Add Sha and its comprised extensions
      riscv: dts: spacemit: add initial device tree of SpacemiT K3 SoC
      riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board device tree

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../interrupt-controller/riscv,imsics.yaml         |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/extensions.yaml      | 169 ++++++
 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  38 ++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 590 +++++++++++++++++++++
 9 files changed, 807 insertions(+)
---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20251216-k3-basic-dt-cd9540061989

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

