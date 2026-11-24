Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491115;
	b=uU5fr8BCO8Ac0T+eLbG+TDRBZon4xdmKi8TrNjUHhTVh3fIScFDP91UlPFNG/kXAlan4
	 U7uq6nsMTRhhVSSKoA2yhtdu8qGJtlu3UcLxjHBaDTjXesGB8P1SNv1eYvRQh76jBCmx+
	 IDIlUCDTX4e19o8ZYyYa7x796PH/N+fS1KWlN7u+OW4xgXbaQWNdIL7jWnzE1NtfuvNeJ
	 Z5IL6HOsP1r+rvU41st6djYmxmGSQp6LLcp9TKT/DGOxzx4BE58Ct72Oohs6sksyi1Hih
	 Jn3tnyh33/YNKkEDs/aA+MFVWGhFaKBa4S2HfRvsCmF7rE8AUBCYhu0i/oWxG32LDDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qKlNSAE1LII8ekZyJm2r7dBRiHTZedE60seDigfXqMg=;
	b=EE2xyogoQ4HH9vqB/XzAdir/zoG8v0Z4Xfo98Y22XUtzN6lXGOOjw284E53dS1/GwH+r
	 6a/kbryGMXpAAbOEnZmmajN9m9VBBPt3nGmgbLjgiGPD6Fi9dZO7jfid1UqHmzqBd7yfQ
	 bUZZW8wGF4BmJlLvYFm0/XRNdh+NfVgnrKLGHtdgksNgIRc2t2VD9bne3ZGVDM8FP9viV
	 bWTDNsfcg8RH85fY/Rd9OlhPIIBFTcyErTjMDMFWg4SSb8uxvbP6W1IrYXJPmTh1dYo/g
	 uzDRXgxwxsiJwtydkiK0yESA5RJusCn0ovqQDGzc2YhfDPL6472SH/g+kPNS6fMl+Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hqr02kTG;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5358606A321
	for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 03:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5358606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hqr02kTG
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb684859cbso2275807a12.1
        for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 19:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491109; x=1796095909; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKlNSAE1LII8ekZyJm2r7dBRiHTZedE60seDigfXqMg=;
        b=Hqr02kTGIoYnGnSblON047xXJDmoPdmbv6AnZ9A5VFBk0YjOqXAUEzr3ARYMKJ+lEk
         Uzcz+y0VIfEwxwEcBRzN0b5gsebVeyLnn3Od1LrQ7gbEP3I2NM8KlwCXN3g/doSC/saA
         Br5ekRzxwZvYF1nkE+zAo4ypmWAEHIFnqfPJ9QJ5Z+6rjprOc7GxkVvyaAHXg6a5Lz2i
         92xr555jBw1LIQv2eaklZd1AtxiCik0nsozWba7EgKUfwgOD7uBeLcSWT0nBK/+0gTm6
         IHByFZ3qSrNbfNVtb+H5UTeV5Xfzg50wSDtkEaO9eZmEdf02ZDPgGeCvvcKVSPFBrrnN
         gLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491109; x=1796095909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKlNSAE1LII8ekZyJm2r7dBRiHTZedE60seDigfXqMg=;
        b=1EVJjC1A05LiOTJYhREJx/Ge7zsZ0Iix/bUjNTgrHzp+hH8WJziloLkdUN9eDm4XXQ
         00gwRtLUZMszI1EY3hhSnsnsAjRNFbWrlHKqDCl/FRTbeWl/X0yj2ZgK/3mhHEZf5ob6
         3QKUTv/rb7jLGtsgaQ5BTgGjtLghk2DnBAvZZmfmR65SMXpHIcBe7g3nP+Chk9shTfnn
         deO12HGL0+lxvzRY5MWLORLt+LhG+68a7NzVEZtM8FX/mpVCMl5owUs01BStu6MLdViS
         92hg2bIi7D/6JWvZvZxo/NB28rrzzvyD+cjOG51Lj8kYjNN2HbvDho34TaP3ZBKhYPJV
         6L3Q==
X-Forwarded-Encrypted: i=1; AL+hErEclKDEP3EIultieBgD3ywtRJKPUVctpPBRrQzWZteOU5Dfc4tWTze6NYCdl2ztWXuGDpmGu+pJ+A==@lists.linux.dev
X-Gm-Message-State: APuU4Z9kzmB2Pyqr/Fs95SkdSamdhvrf7MCR+co31AVUMsdkF5OlvRc4
	63pnnARbherxq6faOr5hR+i75fctbfrTnYcI06N6Of3kXAoToVK8/Qz0
X-Gm-Gg: AZFdTZe5g0uo6E26bgHGAojHIy3cxKycSaqRGQIJlTm1ZxggSE7VtlI4lv/loMestmv
	iPQmpYfj7XHBNDIyf8TdJDPT8cjltuEIhc8juxo/v4mgKGQRdy8zyyCGa5PP7aDpzGmYAAba2q0
	a+bOdxpQoDm6o+wpJWbCZJW1c5JlWddYkCPJffmuXN5yKDd/Lby5CzXd/VrXFG/5JsPBOJbKzlK
	tAArX4J9+KEJAn3iAaFIqccbaZWiR0YKQHQ5KRnvkDsTX2QcPyXKfMjuMPkc3SOqbs8Ia3BqXjN
	oZlRp5mFWqm3x4TZpWO93OvheJEK160KpuYIfWKmYhcYoV+C7q3OxUc8Fsf3iCF2o5WUR+pOA3U
	a4q/xg9z6TUY19EyYqzrRkdLX6Y3G+3jQpZHm7tF6ak5jw8KrIZV+Ja7qBm/mnCcnffATRjbXvg
	g78L8VaG5UHAGCqS1Kke/mysBGo8k+ICor8P/OiQ2eRXJLmQZZ0ctvq2cg99fWwZrpdpYyBYqA+
	MQBCWNtVtLIGEJkDIIX8J29xHeU/cRRvp1N/xhNJAR3uZKhS1ArAqqCoeueYHKxaUqF2kAMSFZ/
	aGmjg9RggmvItqsudUVKJyU4SSnmlR4=
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr14048909a91.58.1795491109076;
        Mon, 23 Nov 2026 19:31:49 -0800 (PST)
Received: from [0.0.0.0] ([20.89.104.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm23890691a91.10.2026.11.23.19.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:31:48 -0800 (PST)
Message-ID: <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
Date: Tue, 24 Nov 2026 11:31:44 +0800
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Junhui Liu
 <junhui.liu@pigmoral.tech>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net>
Content-Language: en-US
From: Zixian Zeng <sycamoremoon376@gmail.com>
In-Reply-To: <awS2-clBenE1r1a1@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Aurelien,

On 2026/11/24 5:58, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-23 12:41, Zixian Zeng wrote:
>> The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
>> 256 bytes with an 8-byte write page, which can be found in schematic[2].
>> The device tree declares pagesize = <16>, which does not match the
>> eeprom chip datasheet which declares pagesize 8 bytes.
> 
> Oops, I am not sure how I got that wrong. Sorry about that.
> 
>> EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
>> together, based on the chip model shown in the schematic diagram.
> 
> The k1-milkv-jupiter board is also affected with the same issue, despite
> using a slightly different EEPROM (24C04).
> 

The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to have
the same issue, which you can find "Page Size: 16 bytes" in datasheet:
https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf

But I don't have the board, simple test would be appreciated. Perhaps I
should include test steps in the commit message for the next revision.

Best regards,
Zixian
