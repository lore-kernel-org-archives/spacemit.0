Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94121114
	for <spacemit@lists.linux.dev>; Sat, 26 Jul 2025 00:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753489675; cv=none; b=s4th+ozth6DcVP388VeiqCyISqDEhRZ2dEohO1GDOUcuD2StKM+bFQz7fMSvqr55LtRmnnwWTEXQlluilzk+lBJCFHubKDPaJyvhCglhC+tCQltyBol60E3ZBFgLyYHeddo6w374qg4bzrGRqftVV4dLAwWoXaILHGpLYu0x3uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753489675; c=relaxed/simple;
	bh=8tob3sWcVX51UsBLlPjKYTZ9XEw5Y47tCecx0S+d5YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZg0GjD7P9TxMF3oytdZC/KlA/ZHs+cAGpq0EOMHApp3q/55GkWHxw7mReiDnUFs3yyo197BPZ2UNTi8MQF8t1YK7gNEJdCEZdm4J57kKpjqlCFSzTwVst+2+lBE/wROm9pIWysbx7FuZtm7Zi6q45nVmQVq4aU71kcbOFyevhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 90FC3340DF2;
	Sat, 26 Jul 2025 00:27:52 +0000 (UTC)
Date: Sat, 26 Jul 2025 08:27:43 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Alex Elder <elder@riscstar.com>,
	"open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>,
	spacemit@lists.linux.dev
Subject: Re: spacemit: P1 PMIC support on Banana pi F3 testing
Message-ID: <20250726002743-GYA752238@gentoo>
References: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>

Hi Anand,

On 15:26 Thu 24 Jul     , Anand Moon wrote:
> Hi Alex,
> 
> Thank you for your work on the P1 PMIC patch for Spacemit K1 SoC - Banana Pi F3.
> 
> I've been testing your patch series for the Banana Pi F3 [0] to enable SD card
> and eMMC functionality,
> 
> [0] https://patchew.org/linux/20250710175107.1280221-1-elder@riscstar.com/
> 
> While debugging, I cross-referenced the patch with the BPI-F3-V3 board
> schematic [1]
> and noticed several discrepancies in the power configuration:
> 
> [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view
> 
> Incorrect Voltage Ranges: The minimum and maximum voltage values for
> multiple regulators
> (including BUCKs, ALDOs, and DLDOs) In the patch, do not match the
> specifications in
> the schematic's power tree.
> 
> Missing/Incorrect Labels: Many regulators are missing accurate labels and names,
> which makes mapping them to the hardware difficult.
> 
> Device Tree Mapping: To configure the power sources correctly, the k1
> user names from
> the schematic needs to be properly mapped to its corresponding device
> tree nodes.
> 
> I’ve put together a set of local changes to better align the regulator
> definitions with the board schematic.
> These adjustments help improve the hardware mapping to the PMIC
> regulators, though some details
> may still need refinement. If you find the changes helpful, please
> consider incorporating them into
> the next revision of the patch.
> 
> I’d be grateful if you could Cc me on any future communication
> regarding testing.
> as I didn’t receive this patch series in my inbox.
> 
> Thanks
> -Anand
> 
> Here is the boot log [2] https://pastebin.com/cXybbVar
> 
> It's not working on my end., Neither the eMMC nor the SD card is
> getting detected.
the mainline driver in tree has no SD card support, but eMMC
so, you could only test eMMC for now.

-- 
Yixun Lan (dlan)
