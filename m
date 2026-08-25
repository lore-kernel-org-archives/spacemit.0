Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED162F7F17
	for <spacemit@lists.linux.dev>; Tue, 25 Aug 2026 05:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635375; cv=none; b=SBlyIObkTSTavtOZYBk0qUYDCR9b2aa6Su63amBbCk/Ar92k+/Pb9hTp+H1YuQyU5/LJ1Ba8QuIw6dccAeJV8NMCFrSq8BvEGI2nK4CsRIhBpYQrMYiwEW6Qa+ck/8bTP7Wnv3oPz8HDy40yzl9kcLowp6+ZTXCETIH0qybCgu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635375; c=relaxed/simple;
	bh=sbZ0ML7wiO8xG+dqK/GHCudY3fQoHSB/ZaIFDWX3uH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ey0xI9KLgrWQ+lY06zph9Is+nbTtRZUeCSoZ9BLhODy00zeqT5r7MEmeuZk28TrhW3WvBDql6tQRwMU1esZ5CnULbl8nPKTAptXUUsCKrUUjYOqXdOTZiUSHAbEWHpOTjQ15tkc/Rcb2tAmt/a1bXWFaydNr5bZLWsAQL77PygI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MletBu2e; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MletBu2e"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so8425395a12.0
        for <spacemit@lists.linux.dev>; Mon, 24 Aug 2026 22:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787635372; x=1788240172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4Q35ypXXFdgC0v5Hs3mRi8V7Q5em2k6GKNR6mE/pGc=;
        b=MletBu2eJrjOopl7OuIWBM2liz+h8WM+Jf3fMwcFlXSYbaEXjs61QZUQ1oECxDmgTU
         tCtnVYSs/WbvW0za0J5cczxnCtpMbBeqaye7Yz0W6xDK0Mw1VwGjE6B+uiIVWQcx7ByC
         faeAfo30XBYZiB7XsFy0gcP5yfh42oZxQzYpaPeUkOLlYjoe+0mDH3S35v+AkCrZvlVr
         cx/PXLIuAU5zOlX83ZKZPOh/JnpYP+GCeK9gmgOHMXsFiJ2QaGTkwzSfITPbYdPn4vxS
         gBL4RgIUmqyx2LpoFCVnUn14HaBJbS+ndtu1WBei92cCSbXszYFSoV1KCGkuLtpXzdIJ
         Uf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787635372; x=1788240172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4Q35ypXXFdgC0v5Hs3mRi8V7Q5em2k6GKNR6mE/pGc=;
        b=quJo6Fg88aJ1vbonek8rkIsnsOpzmLHKqkpbr94JJPGorADaRKOsa8xyn85pxljxMK
         7L4FJBcSnPRNVQcIGGU4Jr83+7HTsI6ky6F5fpHO8SOeKG5iwjqKUEgR3XJC3NDtVr2c
         Pw87I10o5shZGgEMjLbexBj41QhmuoDlc6g4o6chqnAob0jIlGvFoyj9+zeGyyAyVE94
         qKJ2bYCza3DFolr79/ETDHSnLWUYZPnWwpZnGc+yS3jt102Ct90CgOd7+weBDCOTsWNj
         dC+tdmStQCj9tt7pt05PsfIUsdDPwdfYCdP7cSwG/ZeI7zFCMt5Afw8DqLMYcSdsRjaA
         B2QA==
X-Forwarded-Encrypted: i=1; AHgh+RrgV2YLpx9yxtTBM33mYkiKk6br7inpUa7jv6qjIMIwSUcE6SvR3rCsownhHjNWVqgnWfqM9d/Frw==@lists.linux.dev
X-Gm-Message-State: AFuF++lZQQGXaLjGrdsvJESwVclWs3HqQETaYNivglKTvwjcIc9k3C98
	FESgupwvBq0o/9goAWdeWWuihDXeu2jIJYm8DVnXNaLg4o5MIgZW1ffb
X-Gm-Gg: AR+sD10yyYQGZxfyNQPkTeurVHWNe38cNidlKr7SwtmxOfm8UQzb8YAKUjNIpbvf13I
	jT3f5onsFduqUmABZ5QrpieuGmxhXpQtXkK7kUmNga33pZRf5NTIX3aM8krW5PWi2xWXX/bx+zW
	o3MxO+FVUA1qYKXH4AznncI1N2DwKStDKgNVYD2iWgpdrGcVJBKgjDSmykRVizsAyUlQhR4J6Ro
	+2JE4hbVagjYzk0B6W84W/BKKeCRqSc3g3a9VcisZKOM4NNRzh+DKouIpRZKbGfQgqZCG3AE5IT
	s+qIdVsL7EEd/RFVBkMWA2jFIFlqZVQbagfwWn5d+/s+KTiMFOdGFAitTkH3bsgolFEjQrYcgGW
	B4N/aX0ZgDIxETxIfA1YR4+OSyJ7bkIUDREbdzbyB4Al2gZIOGoblsO24JeRaLbv0/zqGBpk5tM
	qTc+29kljEBm7TMtUi3K85gZzkJVipZysg1hCGo7Y0mteOx4v2AxHIToB1bS84gjlilDmTMRiNm
	TotQwj2wZ8o3W+fFYOB4igE7tgjwuGR+jdxAeHLx34vM1R8a5WRqwnJIw==
X-Received: by 2002:a05:6402:a0cd:b0:698:ac8a:9a21 with SMTP id 4fb4d7f45d1cf-6a42f185778mr32938198a12.8.1787635371657;
        Mon, 24 Aug 2026 22:22:51 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2ddad2sm11541114a12.30.2026.08.24.22.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:22:51 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Alex Elder <elder@riscstar.com>,
	Yixun Lan <dlan@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [BUG] PCI: spacemit-k1: port C probe hard-hangs a CPU with one endpoint on Milk-V Jupiter
Date: Tue, 25 Aug 2026 07:22:49 +0200
Message-ID: <20260825052249.66921-1-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On a Milk-V Jupiter, probing the PCIe controller at ca800000 (port C, the
card slot) permanently wedges the CPU that runs the probe when one
particular add-in card is installed.  The CPU stops responding to NMI, and
because the probe is asynchronous, kernel_init() then blocks forever in
async_synchronize_full() and the machine never finishes booting.

The same card, in the same slot, on the same board, does *not* hang the
vendor 6.6 kernel -- it reports "Phy link never came up" and boots normally.
Six other cards do not hang mainline either.  So whatever the electrical
cause, this looks like a robustness problem in pcie-spacemit-k1: an endpoint
should not be able to hang a host-side DBI register access.


HARDWARE
--------
  Milk-V Jupiter v1.1, SpacemiT M1 (socinfo: CPU[M1-8571] REV[C] DRO[130]),
  16 GiB LPDDR4X.
  Firmware: stock vendor U-Boot 2022.10 (k1-bl-v2.2.9), unmodified.
  Port B (ca400000, M.2) has a Samsung PM9B1 NVMe and works throughout.
  Port C (ca800000) is the card slot -- an x8-length connector, silkscreened
  PCIE_X2, wired x2.


REPRODUCED ON
-------------
  v7.1 and v7.2, riscv defconfig (plus PHY_SPACEMIT_K1_USB2, USB_DWC3,
  SPACEMIT_K1_TSENSOR, IGB, IGC, NVMe/ext4 built in).
  gcc 13.3.0 (cross) and gcc 16.2.0 (native, Debian sid).
  Identical failure in all combinations.  Not a regression -- port C has
  never worked with this card on mainline.

Command line:
  console=ttyS0,115200 earlycon root=/dev/nvme0n1p2 rootwait rw
  swiotlb=65536 clk_ignore_unused pd_ignore_unused


SYMPTOM
-------
Port C prints its address ranges and then never speaks again.  (Log below is
from a run with port B disabled in DT, so nothing is interleaved.)

  [ 1.290074] spacemit-k1-pcie ca800000.pcie: host bridge /soc/pcie-bus/pcie@ca800000 ranges:
  [ 1.297283] spacemit-k1-pcie ca800000.pcie:       IO 0x00b7002000..0x00b7101fff -> 0x0000000000
  [ 1.312783] spacemit-k1-pcie ca800000.pcie:      MEM 0x00a0000000..0x00afffffff -> 0x00a0000000
  [ 1.326753] spacemit-k1-pcie ca800000.pcie:      MEM 0x00b0000000..0x00b6ffffff -> 0x00b0000000
  [22.348490] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
  [22.351764] rcu:     4-...0: (12 GPs behind) idle=051c/1/0x4000000000000000 softirq=43/43 fqs=1908
  [22.367040] Sending NMI from CPU 2 to CPUs 4:
  [32.367049] After 10 seconds, these CPUS still haven't responded to the NMI: 4

The CPU ignoring an NMI for ten seconds is why I read this as an MMIO access
that never receives a completion rather than a spin or a deadlock.


LOCALISATION
------------
I added a dev_info() before each step of k1_pcie_init() (patch at the end of
this mail).  The last marker port C prints is the one immediately before the
first DBI access:

  [1.347050] spacemit-k1-pcie ca800000.pcie: K1DBG 1 toggle_soft_reset
  [1.362635] spacemit-k1-pcie ca800000.pcie: K1DBG 2 enable_resources
  [1.370918] spacemit-k1-pcie ca800000.pcie: K1DBG 3 first DBI write (vendor/device ID)
  <nothing further>

i.e. it dies in

        dw_pcie_dbi_ro_wr_en(pci);
        dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);

which is the first register access to the controller after
k1_pcie_enable_resources() has enabled the clocks and deasserted the resets.

I also tried moving phy_init() ahead of that block, in case the DBI domain
needed the PHY running (port B is masked here, because vendor U-Boot
initialises port B's PHY and never touches port C's).  phy_init() returned
success and the DBI access still hung:

  K1DBG 1 toggle_soft_reset
  K1DBG 2 enable_resources
  K1DBG 4 assert PERST# + 100ms
  K1DBG 5 RC mode + AUX_PWR_DET
  K1DBG 6 phy_init
  K1DBG 3 first DBI write (vendor/device ID)     <- still the last line


CARD MATRIX (port C, mainline 7.2, otherwise identical boots)
-------------------------------------------------------------
  empty slot                                          boots
  Intel I210        [8086:1533]  Gen1 x1   link up, enumerates
  HP NC360T         [8086:105e]  Gen1 x2   link up, enumerates
  NVIDIA Quadro P400[10de:1cb3]  Gen1 x2   link up, enumerates
  NVIDIA Quadro T400[10de:1fb2]  Gen1 x1   link up, enumerates
  AMD Radeon RX 550 [1002:699f]  Gen1 x2   link up, enumerates
  Sun ATLS1QGE                             "Device found, but not active"
  HP NC375T                                "Device found, but not active"
  Intel I225-V rev 01                      *** CPU HANG ***

Note the two cards that do not train fail *politely* -- the DWC core logs
"Device found, but not active", the probe completes, an empty bus 0002:00 is
created and the machine boots.  So port C is perfectly capable of handling a
link that never comes up.  The I225-V is different, and it fails long before
link training is reached.

The I225-V card itself is good: it works on a MACCHIATObin (Armada 8040) in
the same office, and it works on this same Jupiter under the vendor kernel.


THE VENDOR DRIVER SURVIVES THE SAME CARD
----------------------------------------
Bianbu 2.3.5 / Linux 6.6.63, vendor k1x-dwc-pcie driver, same board, same
slot, same I225-V:

  [ 1.657482] k1x-dwc-pcie ca400000.pcie: PCIe Gen.2 x2 link up
  [ 2.949762] k1x-dwc-pcie ca800000.pcie: Phy link never came up
  [ 2.952808] k1x-dwc-pcie ca800000.pcie: PCI host bridge to bus 0002:00
  ... boots to a login prompt

The vendor driver does not do the "set the PCI vendor and device ID" DBI
write at that point in its sequence.


HYPOTHESES ELIMINATED BY EXPERIMENT
-----------------------------------
  nvme driver          initcall_blacklist=nvme_init  -- still hangs
  power domains        pd_ignore_unused              -- still hangs
  link training        dies before dw_pcie_iatu_detect()
  kernel version       identical on v7.1 and v7.2
  compiler             identical with gcc 13.3 and gcc 16.2
  PHY init ordering    phy_init() first -- returns 0, still hangs
  CLKREQ# pinmux       CLKREQ# removed from pcie2_4_cfg -- still hangs
  port B interference  port B disabled in DT -- still hangs
  power supply         12 V / 12.5 A bench supply, not USB-C PD


A POSSIBLY RELATED OBSERVATION
------------------------------
k1_pcie_init() writes PCI_VENDOR_ID_SPACEMIT / PCI_DEVICE_ID_SPACEMIT_K1 to
both ports.  On this board the write takes effect on port B but not on port C
-- including on the boots where port C works fine:

  pci 0001:00:00.0: [201f:0001] type 01 class 0x060400 PCIe Root Port
  pci 0002:00:00.0: [1e5d:3003] type 01 class 0x060400 PCIe Root Port

1e5d:3003 is the hardware default (ASR Microelectronics).  So that same DBI
read-only write is being silently dropped on port C even when it does not
hang.  I do not know whether this is the same underlying issue, but it is in
the same function and on the same port, so it seemed worth mentioning.


WORKAROUND
----------
        &pcie2 { status = "disabled"; };

or, from U-Boot, before booti:

        fdt set /soc/pcie-bus/pcie@ca800000 status disabled

With that, mainline 7.2 boots Debian happily on this board with root on the
M.2 NVMe.  Nobody's board is stuck; the slot is just unusable with this card.

Note this is not a problem with the DTS enablement of &pcie2 (added in 7.1) --
an empty slot, and six of seven cards, work fine.


WHAT I AM ASKING
----------------
I do not have the K1 documentation, so I have gone as far as I can from
outside.  I would appreciate a pointer to what could gate that first DBI
access on port C -- CLK_PCIE2_DBI/MASTER/SLAVE, RESET_PCIE2_*, or something
in the PMU/APMU block -- and I am happy to run any test you like on this
board.

Separately, and regardless of the cause: a hard CPU hang on an unanswered
DBI read is an unpleasant failure mode, since there is no completion timeout
and no machine check to abort it on RISC-V.  If there is a sane way to bound
it, that seems worth having.

Full logs for every boot referenced above are available on request.

Thanks,
Bruno Banelli


--------------------------------------------------------------------------------
Instrumentation used for the localisation above (not for merging):

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 04241df8f..d4c08e021 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -130,17 +130,21 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct k1_pcie *k1 = to_k1_pcie(pci);
+	struct device *dev = pci->dev;
 	u32 reset_ctrl;
 	u32 val;
 	int ret;
 
+	dev_info(dev, "K1DBG 1 toggle_soft_reset\n");
 	k1_pcie_toggle_soft_reset(k1);
 
+	dev_info(dev, "K1DBG 2 enable_resources\n");
 	ret = k1_pcie_enable_resources(k1);
 	if (ret)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
+	dev_info(dev, "K1DBG 3 first DBI write (vendor/device ID)\n");
 	dw_pcie_dbi_ro_wr_en(pci);
 	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
 	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
@@ -153,6 +157,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 * delay first.  Write, then read it back to guarantee the write
 	 * reaches the device before we start the delay.
 	 */
+	dev_info(dev, "K1DBG 4 assert PERST# + 100ms\n");
 	reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
 	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_RC_PERST);
 	regmap_read(k1->pmu, reset_ctrl, &val);
@@ -162,8 +167,10 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 * Put the controller in root complex mode, and indicate that
 	 * Vaux (3.3v) is present.
 	 */
+	dev_info(dev, "K1DBG 5 RC mode + AUX_PWR_DET\n");
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
+	dev_info(dev, "K1DBG 6 phy_init\n");
 	ret = phy_init(k1->phy);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
@@ -172,11 +179,14 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	}
 
 	/* Deassert fundamental reset (drive PERST# high) */
+	dev_info(dev, "K1DBG 7 deassert PERST#\n");
 	regmap_clear_bits(k1->pmu, reset_ctrl, PCIE_RC_PERST);
 
 	/* Finally, as a workaround, disable ASPM L1 */
+	dev_info(dev, "K1DBG 8 disable_aspm_l1\n");
 	k1_pcie_disable_aspm_l1(k1);
 
+	dev_info(dev, "K1DBG 9 init complete\n");
 	return 0;
 }
 
