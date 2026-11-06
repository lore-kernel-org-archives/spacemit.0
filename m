Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961910;
	b=eKYK7OCfocX0ZegLiexIIx36BwxzzvpR5wh8OTngHQPSqx8PihaStoAuEmkEqlXrEQ3q
	 wKD1bzHLW9Apv+55WMxP1lyb5vH48SWLcbgV2eNAUOZg5I9W1rnD2HxLqyN4NsUI2vGDP
	 cs+9ximVVJ/AZ8vmYyjITGwisRVLv95Gq3CLlhzZT+ob/NWF1A20eNStGWbRBwgqaDpma
	 GtT7vvnwWTXy9sG7VqNtiF9hWGdCEWr4S2AbU9Yi6d+lmP8oMPc7X8P5C3d9qfBB2+FlK
	 /MBwAbzR/mHvuFTuC/ufrAx2WoI75H2LHmocOGrLivphEh38vbpwA/We2+zvV+JjMVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mK5Jdfitjwy2qBnVXmB5t+/eIsoKS4R4I1jh8e8KWtg=;
	b=lAKTc7g+2zVr/MJeXMuEmz9vzeNOPG9lwil0TKiQRi1WzQDoH1JvL7f758ENshiikpk7
	 N8nUo/r5w076GydMcyCrV0rSourA9tmGFy+FmlCsAOIGqxDMB7FtMce8zz6MlBayR9yVP
	 4kUpUYREK2W2KYMqQ3dJIl+zHBzOw7C1lEiTdt/y+JTw0V3VYhPE7PntmTvnCVAs8N5Qp
	 ocOZ467r1Ggx9wZKPnlho1D7BBQOvV/BXVBR7T0PSXHiDTV9DwmD3HQQ2exIRP918axHt
	 MBCVcLJBh8u+YLI5FmsnIHXqZxLgt6KLhFKmSiX8Ff8FF90KRqqvy7QV9zrRPMRCi/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p28NkKP4;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B91606A330
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 10:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B91606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p28NkKP4
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2ed408b0d0bso3264355ad.0
        for <spacemit@lists.linux.dev>; Fri, 06 Nov 2026 02:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793961909; x=1794566709; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mK5Jdfitjwy2qBnVXmB5t+/eIsoKS4R4I1jh8e8KWtg=;
        b=p28NkKP4Re3QnaRjUdHGTNZqXJnPtampR3CLWlyrB0id6a4GeDECKpaC4cFsvT7/4v
         AQyLFExdUioNxw+VQid2C2takwQz/1FSzVhQtmdyLezBSTO0DJOC+n8a7vjmk5RRfUI3
         M6DBYNvHXh1l2QxVDrt8FUE4G4dzujiHecOCJiEiAPdpBua80QUIqfvcpGnZgW6GgJIv
         vOBYw54Jv9JiJadYRAbotFwO0CSh7ii+QESSt2nI4nbAsRMR6yFsl2hwjViRC4sWgIzd
         UOXqMxef6nUJNPh6wkKm9RbgSCyesCY53To3Sub0537/d1pPQfjhpphw+tkrD4degc47
         ayMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961909; x=1794566709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mK5Jdfitjwy2qBnVXmB5t+/eIsoKS4R4I1jh8e8KWtg=;
        b=F1n/KfnJ/DiuWrEEZIchr9Aw1sJ9ae4ST8V7jZdJnnT+4DhmI4KxLaOR8Zj10K5MM9
         fa+BBPETMR8U+4XIccyHC5eFvY9CgBLVkQVrzKpx6C3s1z5YsYZfhKix+t8yq9DVLjw7
         bdvTO5VwOIxxt80PZnIHAQKsCF48rmivLbetNMURF9T4SKAF8Zjx8xgLh6u3AxCZ6WqR
         JiNUhJ64G+tYBXPfwy6YZzYHe+E8gjdYAjqRZYJzhSX+sqjvCbrqUBbAGbxRZWGPgG8a
         f5i7xRzU/dxU3tNr8FUOg7LDwQYCMa8IBMTWpwze/2yi1kkzifVi7vStCIF+YfW+kx2e
         u81g==
X-Forwarded-Encrypted: i=1; AL+hErFtR0K6CVHaTdjv7pRn0nMTfB9iQ+FDhB0xmsCYFtcyWzERFo2DQIVhNjw3/1x9JelyV7W6eB8jHA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8+7nc4nmZsS0gO1dOt/viFFXr45RVkpZ3rF9ElOxE3jbL5eRKF
	N2G43IAeVYIdoch4yE2SVVHTWDHcdPCUdBeXUK5YTXCLNVxos8dNt6aB
X-Gm-Gg: AYBFou3N0sKTGOJMUUD1kQsMZ05SsgufmhGV9HJkyD5fX8IovAXWejVyc2Ap3NcvCZ6
	HEbobl3ZlPnPmlp+AvEG9hOvhlFanJH2U4lqs17H2ORE6V+SdoRdSsAzvIYIBWFaxLeAvrish+3
	vi0qOIfn+UuIJoild83j1dWf3ESgZViWoMnu3D9PD9vLRYCOo217j6XS7i0uQdEpJGvysXrxQg5
	zKkWzoL1zjndru9YcExnF2X7bNolO/930BQkJ3HvgmOA91wtqopzcOcXwpiFJQlIEOLEPWkZcub
	ONn5sBnA1r5st84sen0g4g/rYF4d/pUL9dxYZ/IiJAVedOGcefAJsfNdw55SpfY5t4G3Aishj0F
	PUVInC/4ATxB83eXnku4UHS1tqa8yfJLHvjP7Z2zGIkfNfPbTa32PHElQyxtIHXmwzvg69pEJLf
	zu5ENQbjsWVkyL1jK9C2+N0JdW9SQux0zGBfYXLvHFju92E3qsGs37BEXhys+9k1IuosiaW/7TD
	d4PnQD02bGRqUcGv89MNRJt9FQlqHR/MdWzFfuRsrXTBOkCVYrcu+y1nZe2hb7M3OHEVWgCcYpj
	Le0+yqFlCromT/lizR5TPzO5SJbHh0zz3dgwovQ7UGvIQefgbO9WWnZUGKg=
X-Received: by 2002:a17:902:da87:b0:2ed:205e:eabc with SMTP id d9443c01a7336-2ed41bbd3d4mr26889285ad.32.1793961908564;
        Fri, 06 Nov 2026 02:45:08 -0800 (PST)
Received: from [192.168.100.182] ([110.93.227.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8915esm4095755ad.67.2026.11.06.02.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:45:06 -0800 (PST)
Message-ID: <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
Date: Fri, 6 Nov 2026 15:44:50 +0500
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
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chukun Pan <amadeus@jmu.edu.cn>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Tomas Hlavacek <tmshlvck@gmail.com>, Muhammad Bilal <meatuni001@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 2:43 PM, Troy Mitchell wrote:
> On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
>> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>>   		return 0;
>>   	}
>>   
>> +	rtnl_lock();
>>   	emac_stop(ndev);
>> +	rtnl_unlock();
>>   
>>   	clk_disable_unprepare(priv->bus_clk);
>>   	netif_device_detach(ndev);
> This can deadlock. emac_stop() -> emac_down() calls
> cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
> emac_tx_timeout_task() starts with rtnl_lock().
> 

Thanks Troy, that makes sense.

For the deadlock, I think the correct function to call is rtnl_trylock() 
inside the emac_tx_timeout_task(), which would return if the lock is 
already held and will hold the lock if it is not.

What are your thoughts on this? Does a v2 changing rtnl_lock() to 
rtnl_trylock() inside emac_tx_timeout_task() make sense?

Regards,
Ali
