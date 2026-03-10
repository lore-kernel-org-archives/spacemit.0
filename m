Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E579B363C56;
	Tue, 10 Mar 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135683; cv=none; b=LhkX+QRzoC/CCxjc3WP6ZYBL4BLW5/jOE67CdqkgXMTQmHjRosj8wmKc50HtfqxzkdT9kD4r+e8ZXaoDywJXYWUQQx4mheBiHVTry+HdjAI3iQlICEk03YtjqHK9ZxHXRkl53LW8jA6pz57XmTc/hepBHYlbnIkfLoAwfH5wILE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135683; c=relaxed/simple;
	bh=MI2ZH/AeYekSd3NSVEh03PNPVermAkXlM9wK0xXJndo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XOIgzrjs1RtOPWovZbnMcfVS5Tz4kpFnhhVcZ0tcbZE7z51nFqtcP7Eg0msbfTS907lxA6GNKb+OWbkuJnS/S6q71CEz3WSmCcNosz6LePF4W2v90gGmXafju1Ie5yDxdeYUSJC3ME5J6eEh6aEvwI9S2Y5eVZD23uAKcCPyQc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPhHeSLv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPhHeSLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01085C19423;
	Tue, 10 Mar 2026 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135682;
	bh=MI2ZH/AeYekSd3NSVEh03PNPVermAkXlM9wK0xXJndo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPhHeSLvqH1vkiIgPz+naYAdqXxvvcUfiHk7VBW8dcd4lLCQ6syQGWbXbxQurP1ap
	 wx8EjMS6loe1lUWPiakYO+mIVl2X67FWE55bIAqFFjCiPyy/y4EwJ8Is0bUOh1z5u8
	 13N1P17ujnqmIW8VwvcTovqe9jnBibP91khnZSDiGNQshuPedMMEnWj67wxaPLiTNR
	 dHZdvnE5YxyLUijKIR81POj0G8JCR7tA0ofhINFGGwvzG8TnokcDRQyyl1TdzO0sSx
	 WHlpcFtSALky340mtDCptJmtUz0pG7iWRLJlubbz218Mzhe6Z+ATkUgR807sk+KTW+
	 AvKSqxUJ27RIA==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
Date: Tue, 10 Mar 2026 09:41:14 +0000
Message-ID: <177313556765.25225.2115332539060652807.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309030000.1157040-1-amadeus@jmu.edu.cn>
References: <20260309030000.1157040-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Mar 2026 11:00:00 +0800, Chukun Pan wrote:
> The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
> 'linux,pci-domain' property to assign a PCI domain number to
> each of the controllers instead of assigning it randomly.
> 
> This creates a stable sysfs path, allowing userspace scripts
> to reliably target specific PCIe devices (such as PCIe NICs).
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
      https://github.com/spacemit-com/linux/commit/86314111f654310a69c9775e35e263c036031675

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
