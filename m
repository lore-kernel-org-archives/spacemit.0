Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0331175A66;
	Thu, 30 Apr 2026 02:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515337; cv=none; b=urZdzGVteG8hmjut2Nfnl/BliQP0j5Pzzixv45EOvXb+hfNjVegPeunePt0AjXlmRoRVVJv6hSbcTnwUP3c7ygMz3EGfN0tmk18f9stvopQlpEmglCdIVv02clkpv/LgxvOdOIhDkvNsjv4P/zVFq9Ge8nVODc9fm/ZBNv95XRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515337; c=relaxed/simple;
	bh=jkFbsZv80WhUCN9nNYsE/0yusKIPtiSFJwy+bl0lj08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQmiAwBYNKk9SuI8Dv5K4P5xSiZUWwQ4RrJQpimrDM18p9onW+Inz7QtpOKEAQ3YY2YVbpuBFuFxZF24gjBLVAxP7PHf9PHiouqBW6VUE0IC5d/erEjNoygvCaEoHw/Wyr6G3ZP8AzO8dfMLs8H6rQfwdf19TWtTuGEnIMbiSQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWOc8XIo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWOc8XIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F879C2BCC6;
	Thu, 30 Apr 2026 02:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777515337;
	bh=jkFbsZv80WhUCN9nNYsE/0yusKIPtiSFJwy+bl0lj08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWOc8XIoCNPYD65XF4uhGZeI1N+hz3dKnKWjOYSZeBR1r6YqrpKc00WBLmzP4YlS4
	 lG1QxAmye2QDNXhg2RWkZgmYmHihNdobwZxIjthp8sCU3vRswj1od8PfagZOCmmkrf
	 e29RyuvdT5r+6AW34xVoBOn1dS7Jy33HacccTo8XDDzZyCBAnDlnfNAtEA8FwUeN+a
	 wLF7jUwo62sA94D8JrZSLeIDOBN1J5RkysXhv+iqeocuMvDb/D52lx5Oc5MuGgTZm5
	 WVNReLZ9GJKNsXwlSuN1XxR+iLi3tHVOFQCfjRH0npv7D4RnENUZQQ3wbjQryy4yp+
	 XXSQo3jgqH48Q==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v10 0/3] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Thu, 30 Apr 2026 02:15:31 +0000
Message-ID: <177751531219.2920128.7013231454370022274.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775575436.git.gaohan@iscas.ac.cn>
References: <cover.1775575436.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Apr 2026 23:28:13 +0800, Han Gao wrote:
> Changes in v10:
>  - patch 3:
>    add vin-supply in pcie_vcc3v3
>    reorder vcc5v0_usb30
>    remove vpcie3v3-supply form pcie1
>  - Link to v9: https://lore.kernel.org/linux-riscv/cover.1775417019.git.gaohan@iscas.ac.cn
> 
> [...]

Applied, thanks!

[1/3] riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
      https://github.com/spacemit-com/linux/commit/ece83d42785e12ab7690c0c13b416baf46a74063
[2/3] riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
      https://github.com/spacemit-com/linux/commit/c02c047b925c0ed101ec6834e1c07a53a45f98d4
[3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
      https://github.com/spacemit-com/linux/commit/e3e433dd9aa04448f8f98d59359cab1340d994a3

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
