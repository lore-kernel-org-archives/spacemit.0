Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E948C396D28;
	Tue, 24 Mar 2026 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334353; cv=none; b=A4rIfHaYhDM7W4nopZSdIVV6MYVwzVhsOOjwR1sYozi1C7dFc2+0xYjN1AHJ3SjUSIWOadfb+B4O1PBzVD3MkEZstJhm2k545KzuzBTtYP7oDxUwU1XkLuMtDVF/BmP6+s7PjsivD0bckP8sMHl3kMmfs64vFGSvhbjoCj0C/qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334353; c=relaxed/simple;
	bh=iGOx98UP1vpKG7YZd8YE9BQwS0A7jTMzxUvXgeGAHSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YBd4Zm76tYbUEqsgaWDeXlKRpDBCuhEs51Jhp43vjj7yOaGhbmtwqAFIziTEmADcJuyjGueelZabMPT244X3T0Hb6Iwdf4DrH+mzF5zyNu+zZk3yIXUtqJ44I9tLsc2HwFPBgCQRw39w8AVVLtXtfslZMcgXXiLFU9VoIzbp3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIYAFh2g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIYAFh2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE645C19424;
	Tue, 24 Mar 2026 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774334352;
	bh=iGOx98UP1vpKG7YZd8YE9BQwS0A7jTMzxUvXgeGAHSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MIYAFh2g2nIzaNuvfWL9VyTrtDpxmGBSHkZhSvtgc+x75Fglabmstk1493Y4Z663v
	 LQtXlwI4E7l98/786lVYUJJzg7G5dO0Zq2oFBEVBTfQ9JNM83h0gWzw1JRbXp3ML6V
	 iazVL0QdPBYBlwL2M9Hr4VwFpnyZvJvb7hMN38yDruQvIK63NuTSwUIpj+v8owHEtk
	 Lb22TfPqBTuAm0NfBgP6xARy/CUduJRtlJm94WbwUXw6P31GKjuGU6Vib+vY5OdGjQ
	 oluiuJOpxlgcitfDyO1rjuzS8lIrO3xKC4FzMIMvj6W4fM57Sgs4Hz6ENFRxnkof3n
	 YDu7B7fqbcsBg==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: reorder phy nodes for K1
Date: Tue, 24 Mar 2026 06:39:02 +0000
Message-ID: <177433411962.241042.5017156711988723087.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318100000.3934516-1-amadeus@jmu.edu.cn>
References: <20260318100000.3934516-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Mar 2026 18:00:00 +0800, Chukun Pan wrote:
> Reorder the PHY nodes of USB and PCIe to the correct positions based on
> the register address. This improves the readability and maintainability
> of the DT. No functional change is introduced by this reordering.
> 
> 

Applied, thanks!

[1/1] riscv: dts: spacemit: reorder phy nodes for K1
      https://github.com/spacemit-com/linux/commit/eac600d5cc42b04e799fb65169b8f4060773381b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
