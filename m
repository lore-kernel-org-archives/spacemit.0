Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0431A057
	for <spacemit@lists.linux.dev>; Mon,  3 Nov 2025 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762188677; cv=none; b=phkGDJGxqVj0kN9qjeyPibM2RkRnpI4W5OK2P0bD+XcjHcdWz8FgTU5YuVuR2pB0hI89T2rFNOvPoF0aOw7rAIkvvt7UsIKgir6cH1j/OGWTAv+5wJZRV0Iwz4Y5m/KJ/HQJYCnqrtrEWQ8qMBReDU5OT19swmbAhzyyMsJ25XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762188677; c=relaxed/simple;
	bh=9X5qYxyuX7GnNfRV7eA4zSQai4y1CCQShsSie8Vm55M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Swy5ZQg9pNioCkXNEZUntvJ+RS2+EUUiM7CqOCn7erhvU9lYaaD4lej+FjHa5yy+22L7FbjFKek3D28PA+GY08xdO6LQ2mMuEsHhTC3+NWL8jsS2skowk+ERFeqZuEqtlwC3Y+huug70LmUIU5K0+aSpm2FMPtiRLDx2Kmiu/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YhasSdFp; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YhasSdFp"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-9482ba6fc24so265033939f.2
        for <spacemit@lists.linux.dev>; Mon, 03 Nov 2025 08:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762188673; x=1762793473; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ZYP6s7A0e6t6qMHErZJUr+ea4gjElbTNwHT5ZSG9V0=;
        b=YhasSdFp/ZNPqxjnH1o6tfQcaD9iQMUxYySOnKJU5yD/utKEOwNgRw6nbp7WIhbMle
         PTzpI27TwlLqqOfxSqhHbe4MEpFtvm3C8Ux3t/V586rcBbnCy9r3VLN9wlx7tImSEcQ3
         zJhaRYkiq5w+Q7M0tLntCGOHYZz8WCsw1YUT8kjrIyrGUC+1YBIDcWtOJBN9YSeQZcwC
         tiiy4qXP2fKR2ulnOfpSWSNRiWACj+tqfjh4sZGS9Z4Ptzd0MwtX5twjndHbByj5N+9i
         ZrvSEiA9hAQnHu8eyzojxlZQyiujRZbDxqZ5SW96US8zAG98nPgvvr+stGgwBViNZPAX
         tgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762188673; x=1762793473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZYP6s7A0e6t6qMHErZJUr+ea4gjElbTNwHT5ZSG9V0=;
        b=wp0okq3eJqyAtph42odRkJ+yKVar4qrIsFtfxywZbq9vnYMUM0nPVJq03XnpTqCcRC
         D3rPFlFq6sLwHN48nX42R0KzQoSOepZVse3ov9KjEKKwOyOmUM/m+4Z2Yj++XpbAhfa2
         6zDwDW/KlCzBagU3YT6OkucWGksP4R08ImXWeGRBrQG2qbu9t277j3iH0YOZctOR3A6j
         Tvm/N3jb+9VsoGY8w26fy7C9mUgwaCBuiPQAZQ/KZ9pdO3d8k1wgxlMZnQt8jaRwx7oq
         yqDpzvWskVdvJyaiWPqyFd8XnpHvXEIUPXrCQmDTQTOS/oPmiN4Ef2irJ5q9thqly6q3
         gizQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdMVaJ/gCHNggkGNE+Z7F6bnbDzIZkRYD+sTRG6u13CZsGzRmjpMCGllK0NzsGtu8kyMXyedkSfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwiKCfu0isLUog7aITfGwlemguEDP5Dze2vA/nHxzSgSChV08YM
	olFHxLwGxzzIW4tN0JY4cIrwpCzF4wRSSYlFzN6sFjqZfxf7UXyPR6L55hbVxXnPt7A=
X-Gm-Gg: ASbGncuLJ+1CRUrggLsJ8pmNNTzamM28ZjSmiFPoIbr4MNTnXlKAhYZmMRDse/yjqYe
	fe7S4zYQkjmSMLKRz08yORjrVKh8mDu7rLiCEy8Ewd+zLdlk/6bGt2QhZLXORjeqfPfnXOJOV9j
	L4php2PsRjudetueOyHPA/UPqXxuACw7wi3zVt08cvzVkEuecd9oR8VCI5JAg/A5TE5ngXc6qQ1
	ovHF3/GeGvA8kIs4woGB8rKyWutMdwrL9iCLQm75d1SWX12LP5r+15QNKcAk3uom85FsRkZ8lVI
	/+CjHfeE9EabcdUGNH2xiiA9w3pqTeFe1KHDnde79kJ5x/y4nYLES2KqcowSuOoOXD9gKlSXLDz
	Esm96DrnGjuaxPLFLPHMvFAuYQFT3SAIgnc7Nv9Z95cCuMxce/Xhm93dvXCNPeQf1Jc7xENhxCe
	PF/5OsLBwW9wwd4KhcfcbrO8T0OLq3HQGIBiq1dtisplN3mqDzcm0=
X-Google-Smtp-Source: AGHT+IG3IvG/mEvLf0CP6EjG0xRAhCkqKP6lfBEvoWKsucXyQJGlFuxO7exsoiSwRmrN+GNPUYV9uA==
X-Received: by 2002:a05:6e02:174b:b0:433:2d6a:ec2b with SMTP id e9e14a558f8ab-4332d6b190fmr50614775ab.24.1762188673045;
        Mon, 03 Nov 2025 08:51:13 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7226ba48dsm324005173.49.2025.11.03.08.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 08:51:12 -0800 (PST)
Message-ID: <6872beb1-f27f-48b9-a756-5b7faa380cec@riscstar.com>
Date: Mon, 3 Nov 2025 10:51:11 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, dlan@gentoo.org, johannes@erdfelt.com,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 shradha.t@samsung.com, inochiama@gmail.com, guodong@riscstar.com,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251030220259.1063792-1-elder@riscstar.com>
 <20251030220259.1063792-6-elder@riscstar.com> <aQU4rGzrB1-Vu7C6@aurel32.net>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aQU4rGzrB1-Vu7C6@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/25 5:31 PM, Aurelien Jarno wrote:
> Hi Alex,
> 
> On 2025-10-30 17:02, Alex Elder wrote:
>> +/* Disable ASPM L1 for now, until reported errors can be reproduced */
> 
> Thanks for adding this function.
> 
>> +static void k1_pcie_post_init(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> +	u8 offset;
>> +	u32 val;
>> +
>> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +
>> +	dw_pcie_dbi_ro_wr_en(pci);
>> +
>> +	/* Turn off ASPM L1 for the link */
>> +	val = readl(pci->dbi_base + offset + PCI_EXP_LNKCAP);
> 
> Why not using dw_pcie_readl_dbi() instead?
> 
>> +	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
>> +	writel(val, pci->dbi_base + offset + PCI_EXP_LNKCAP);
> 
> And here dw_pcie_writel_dbi()?
> 
>> +
>> +	dw_pcie_dbi_ro_wr_dis(pci);
>> +}
>> +
>> +static void k1_pcie_deinit(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> +	struct k1_pcie *k1 = to_k1_pcie(pci);
>> +
>> +	/* Assert fundamental reset (drive PERST# low) */
>> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>> +			PCIE_RC_PERST);
>> +
>> +	phy_exit(k1->phy);
>> +
>> +	k1_pcie_disable_resources(k1);
>> +}
>> +
>> +static const struct dw_pcie_host_ops k1_pcie_host_ops = {
>> +	.init		= k1_pcie_init,
>> +	.post_init	= k1_pcie_post_init,
> 
> Unfortunately, while I can see the effect of the change with for
> instance lspci -vvv, this happens way too late in the device scan
> process, i.e. after pcie_aspm_override_default_link_state() and causes
> L1 to still be enabled.

OK thanks for this information.  I am going to contact you
privately to get more information on your errors (and those
Johannes is reporting) so that I can try to resolve them
before I post the next version of this patch series.

					-Alex

> 
> I have tried to move it earlier, in k1_pcie_init() after writing the
> vendor and device IDs. This works as long as "nvme scan" is run in
> U-Boot. But if I don't run this command, it seems that the change is
> ignored or lost (i.e. I can still see L1 enabled with lspci -vvv).
> 
> Moving it at the end of k1_pcie_init() works fine, like moving it at the
> beginning of k1_pcie_start_link(). But my knowledge is too limited to
> know where is the correct place.
> 
> Regards
> Aurelien
> 

